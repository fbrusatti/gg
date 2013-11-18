class Document < ActiveRecord::Base
  
  # == Accesors
  attr_accessible :type, :number, :recharge, :amount, :balance, :state,
                  :expiration_date, :payment_condition, :active, :annul,
                  :creation_state, :customer_tokens, :amount_cash, :amount_check
  
  attr_reader :customer_tokens

  # == Associations
  belongs_to :customer
  belongs_to :user
  belongs_to :supplier
  has_many :items
  has_many :products, through: :items
  has_many :check
  
  def customer_tokens=(ids)
      self.customer_id = ids
  end    

end
