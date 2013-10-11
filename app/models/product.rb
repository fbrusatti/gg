class Product < ActiveRecord::Base

   # == Accesors
  attr_accessible :active, :code, :cost_price, :description, :gondola, 
                  :list_price_one, :list_price_three, :list_price_two, 
                  :minimun_stock, :shelf, :stock, :category_id, :vat_id         

  # == Associations
  has_many :categories
  has_one :vat

end
