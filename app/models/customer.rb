class Customer < ActiveRecord::Base

  # == Accesors
  attr_accessible :address, :cuit_cuil, :dni, :email, :gross_income, :mobile_phone,
                  :name, :phone, :registered_name, :surname, :type_iva

  # == Validations
  validates_presence_of :name, :surname, :phone, :cuit_cuil, :type_iva
  validates_format_of :email, { :allow_blank => true,
                                :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

  # == Associations
  belongs_to :user
  has_many :invoices

  def name_to_invoice
    registered_name || "#{name} #{surname}"
  end


  def is_A
    self.type_iva == t("customers.type_iva.registered_taxpayer")
  end
end
