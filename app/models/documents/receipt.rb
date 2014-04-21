class Receipt < Document

  # == Associations
  has_many :payments
  has_many :invoices, :through => :payments

  # == Callbacks
  before_create :calculate_amounts, :discount_invoices


  def calculate_amounts
    cards_array = self.cards
    cards_array.map { |card| self.amount = self.amount + card.amount }  
    checks_array = self.checks
    checks_array.map { |check| self.amount = self.amount + check.amount }
    self.amount = self.amount + self.amount_cash
    self.balance = self.amount * (-1)
  end

  def discount_invoices
    invoices_array = self.invoices
    invoices_array.map { |invoice| verify_conditions(invoice) }
  end

  def verify_conditions(invoice)
    if (invoice.balance > 0) 
      new_balance = (invoice.balance + self.balance)
      if (new_balance <= 0) 
        invoice.balance = 0
        invoice.annul = true
        invoice.save
        self.balance = new_balance
      elsif (new_balance > 0) 
        invoice.balance = new_balance
        invoice.save
        self.balance = 0
      end
    end 
  end

end
