class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :type
      t.string :number
      t.decimal :recharge, precision: 8, scale: 2
      t.decimal :amount, precision: 8, scale: 2
      t.decimal :balance, precision: 8, scale: 2
      t.string :state
      t.date :expiration_date
      t.string :payment_condition
      t.boolean :active
      t.boolean :annul
      t.references :customer
      t.references :user
      t.references :supplier

      t.timestamps
    end
    add_index :documents, :type
    add_index :documents, :number
    add_index :documents, [:type, :id]
  end
end
