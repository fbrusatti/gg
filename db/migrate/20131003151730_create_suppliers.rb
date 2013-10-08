class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :address
      t.string :cuit_cuil
      t.string :dni
      t.string :email
      t.string :gross_income
      t.string :mobile_phone
      t.string :name
      t.string :phone
      t.string :registered_name
      t.string :surname
      t.string :type_iva

      t.timestamps
    end
  end
end
