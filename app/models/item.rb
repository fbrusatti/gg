class Item < ActiveRecord::Base
  # == Accesors
  attr_accessible :amount, :price_cost, :price_sale, :price_vat, :price_descount
  # == Associations
  belongs_to :document
  belongs_to :product
end
