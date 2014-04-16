class Item < ActiveRecord::Base

  # == Accesors
  attr_accessible :amount, :price_cost, :price_sale, :price_vat, :price_descount,
                  :document_id, :product_id, :total_price, :annul

  # == Associations
  belongs_to :document
  belongs_to :product

  def product_code
    self.product.code
  end

end
