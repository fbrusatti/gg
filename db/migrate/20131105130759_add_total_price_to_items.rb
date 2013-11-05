class AddTotalPriceToItems < ActiveRecord::Migration
  def change
    add_column :items, :total_price, :decimal, precision: 10, scale: 2
  end
end
