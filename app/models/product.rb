class Product < ActiveRecord::Base

   # == Accesors
  attr_accessible :active, :code, :cost_price, :description, :gondola, 
                  :list_price_one, :list_price_three, :list_price_two, 
                  :minimun_stock, :shelf, :stock, :category_id, :vat_id         
  
  # == Validations
  validates_presence_of :code, :minimun_stock

  # ==validations
  validates_presence_of :code

  # == Associations
  has_many :categories
  has_one :vat
  
end
