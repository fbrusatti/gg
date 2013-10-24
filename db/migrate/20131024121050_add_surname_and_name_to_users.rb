class AddSurnameAndNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, :null => false, :default => "User "
    add_index :users, :name
    add_column :users, :surname, :string, :null => false, :default => "Default"
    add_index :users, :surname
  end
end
