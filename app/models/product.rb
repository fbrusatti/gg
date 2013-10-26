class Product < ActiveRecord::Base

  # == Accesors
  attr_accessible :active, :code, :cost_price, :description, :gondola,
                  :list_price_one, :list_price_three, :list_price_two,
                  :minimun_stock, :shelf, :stock, :category_id, :vat_id, :money_id

  # == Validations
  validates_presence_of :code, :minimun_stock

  # ==validations
  validates_presence_of :code

  # == Associations
  has_and_belongs_to_many :categories
  has_many :items
  has_many :documents, through: :items
  belongs_to :vat
  belongs_to :money
end
