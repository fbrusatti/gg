class AddAnnulToCheck < ActiveRecord::Migration
  def change
    add_column :checks, :annul, :boolean, :default => false
  end
end
