class AddTypePersonToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :type_person, :string
    add_column :customers, :type_iva, :string
  end
end
