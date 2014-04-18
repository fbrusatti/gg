class Item < ActiveRecord::Base

  # == Accesors
  attr_accessible :amount, :price_cost, :price_sale, :price_vat, :price_descount,
                  :document_id, :product_id, :total_price, :annul

  # == Associations
  belongs_to :document
  belongs_to :product

  before_save :calculate_total_price

  def product_code
    self.product.code
  end

  def net_cost
    self.price_cost + (self.price_sale * self.price_cost) / 100
  end

  def calculate_total_price
    ncost = net_cost
    tprice = ncost - ncost * self.price_descount / 100
    tprice += tprice * self.price_vat / 100
    tprice = (tprice * self.amount).round 2
    self.total_price = tprice
  end

end
