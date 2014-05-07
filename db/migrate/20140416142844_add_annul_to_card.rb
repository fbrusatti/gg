class AddAnnulToCard < ActiveRecord::Migration
  def change
    add_column :cards, :annul, :boolean, :default => false
  end
end
