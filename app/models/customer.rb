class Customer < ActiveRecord::Base
  attr_accessible :address, :cuit_cuil, :dni, :email, :gross_income, :mobile_phone, 
                  :name, :phone, :registered_name, :surname
end
