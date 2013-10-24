class Vat < ActiveRecord::Base
  
  # == Accesors
  attr_accessible :percentaje

  # == Validations
  validates_presence_of :percentaje

end
