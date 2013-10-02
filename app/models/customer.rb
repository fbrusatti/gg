class Customer < ActiveRecord::Base

  # == Accesors
  attr_accessible :address, :cuit_cuil, :dni, :email, :gross_income, :mobile_phone, 
                  :name, :phone, :registered_name, :surname, :type_iva

  # == Validations
  validates_presence_of :name, :surname
  validates_format_of :email, { :allow_blank => true, 
                                :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }                

  # == Associations
  belongs_to :user

end
