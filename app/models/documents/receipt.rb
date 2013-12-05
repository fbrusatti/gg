class Receipt < Document

  has_many :payments
  has_many :invoices, :through => :payments

end
