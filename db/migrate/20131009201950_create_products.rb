class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :description
      t.integer :stock
      t.integer :minimun_stock
      t.float :cost_price
      t.string :code
      t.boolean :active
      t.string :gondola
      t.string :shelf
      t.float :list_price_one
      t.float :list_price_two
      t.float :list_price_three

      t.timestamps
    end
  end
end
