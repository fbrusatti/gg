class AddUserIdToSupplier < ActiveRecord::Migration
  def change
    add_column :suppliers, :user_id, :integer
    add_index :suppliers, :user_id
  end
end
