class AddReferrerIdToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :referrer_id, :integer
    add_index :categories, :referrer_id
  end
end
