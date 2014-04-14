class Invoice < Document

  # creation_state  - The different status are:
  #                   'init' by default
  #                   'building'
  #                   'finish'
  #
  # state  - The different status are:
  #           'confirmed'
  #           'paid'
  #           'canceled'
  #           'partially_paid'

  # == Callbakcs
  before_save :generate_number, :set_dates, :set_payment_condition,
               :change_state, :set_balance, if: Proc.new { |i| i.creation_state == 'finish' }
  after_save :descount_amount,  if: Proc.new { |i| i.creation_state == 'finish' }



  # == Associations
  has_many :payments
  has_many :receipts, :through => :payments

  # == Accesors
  attr_accessible :product_tokens, :customer_tokens
  attr_reader :product_tokens, :customer_tokens

  def product_tokens=(id)
    self.product_id = id
  end

  def customer_tokens=(id)
    self.customer_id = id
  end

  private
    def descount_amount
      self.items.each do |i|
        i.product.stock -= i.amount
        i.product.save
      end
    end

    def generate_number
      result = Document.where(invoice_type: self.invoice_type,
               active: true).maximum("number") || 0
      # result << (Document.connection.execute("SELECT nextval('number_no_seq')"))[0]['nextval']
      self.number = result + 1
    end

    def change_state
      self.state = 'confirmed'
    end

    def set_dates
      self.emission_at = Date.today if !self.emission_at.present?
      self.expiration_date = emission_at + 30.day
    end

    def set_payment_condition
      self.payment_condition = 1
      self.payment_condition = 2 if !is_current_acount
    end

    def is_current_acount
      return false if amount_cash > 0 ||
                   self.checks.count > 0
                   # ||  self.cards.count > 0
      return true
    end
    def set_balance
      self.balance = 0
      self.balance = amount if is_current_acount
    end

end
