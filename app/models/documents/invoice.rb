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
  before_save :generate_number, :change_state, if: Proc.new { |i| i.creation_state == 'finish' }
  after_save :descount_amount, if: Proc.new { |i| i.creation_state == 'finish' }


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
      result = Invoice.connection.execute("SELECT nextval('number_no_seq')")
      self.number = result[0]['nextval']
    end

    def change_state
      self.state = 'confirmed'
    end
end
