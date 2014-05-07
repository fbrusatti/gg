class Payment < ActiveRecord::Base
  
  # == Accesors
  attr_accessible :amount, :invoice_id, :receipt_id

  # == Associations
  belongs_to :invoice
  belongs_to :receipt
end
