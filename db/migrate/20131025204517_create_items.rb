class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :document
      t.references :product
      t.integer :amount
      t.decimal :price_cost, precision: 8, scale: 2
      t.decimal :price_sale, precision: 8, scale: 2
      t.decimal :price_vat, precision: 8, scale: 2
      t.decimal :price_descount, precision: 8, scale: 2

      t.timestamps
    end
    add_index :items, :document_id
    add_index :items, :product_id
    add_index :items, [:document_id, :product_id]
  end
end
