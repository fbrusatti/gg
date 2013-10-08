class AddTypePersonToSupplier < ActiveRecord::Migration
  def change
    add_column :suppliers, :type_person, :string
  end
end
