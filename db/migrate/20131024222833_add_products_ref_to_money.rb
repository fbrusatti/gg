class AddProductsRefToMoney < ActiveRecord::Migration
  def change
    add_column :products, :money_id, :integer
  end
end
