class Receipt < Document

  # == Associations
  has_many :payments
  has_many :invoices, :through => :payments

  # == Callbacks
  after_save :discount_invoices

  def discount_invoices
    invoice_id = self.invoices
    invoice_id.map { |invoice| verify_conditions(invoice) }
  end

  def verify_conditions(invoice)
    if (invoice.balance != 0) 
      new_balance = (invoice.balance - self.amount)
      if (new_balance < 0) 
        invoice.balance = 0;
        invoice.save
        @new_receipt = Receipt.new()
        @new_receipt = self
        @new_receipt.balance = new_balance
        @new_receipt.save
      elsif (new_balance > 0) 
        invoice.balance = new_balance
        invoice.save
      else 
        # This condition maybe will can merge with last condition, but (new balance >= 0)
        invoice.balance = 0
        #Sacar de la cuenta corriente
        invoice.save
      end
    end 
  end

end
