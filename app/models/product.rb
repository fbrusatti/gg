class Product < ActiveRecord::Base

  # == Accesors
  attr_accessible :active, :code, :cost_price, :description, :gondola,
                  :list_price_one, :list_price_three, :list_price_two,
                  :minimun_stock, :shelf, :stock, :vat_id, :money_id,
                  :category_ids, :categories, :category_tokens

  # == Validations
  validates_presence_of :code, :minimun_stock, :category_ids, :description

  # == Associations
  has_and_belongs_to_many :categories
  has_many :items
  has_many :documents, through: :items
  belongs_to :vat
  belongs_to :money

    # == attr reader
  attr_reader :category_tokens


  accepts_nested_attributes_for :categories

  def category_tokens=(ids)
      self.category_ids = ids.split(",")
  end
end
