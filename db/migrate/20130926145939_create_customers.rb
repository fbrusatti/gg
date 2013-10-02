class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :dni
      t.string :name
      t.string :surname
      t.string :mobile_phone
      t.string :phone
      t.string :email
      t.string :registered_name
      t.string :cuit_cuil
      t.string :gross_income
      t.string :address

      t.timestamps
    end
    add_index :customers, :name
    add_index :customers, :surname
    add_index :customers, :dni
  end
end
