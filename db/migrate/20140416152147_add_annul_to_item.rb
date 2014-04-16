class AddAnnulToItem < ActiveRecord::Migration
  def change
    add_column :items, :annul, :boolean, :default => false
  end
end
