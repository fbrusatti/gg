class AddDefaultValueToDocument < ActiveRecord::Migration
  def up
    change_column :documents, :annul, :boolean, :default => false
    change_column :documents, :active, :boolean, :default => true
    change_column :documents, :amount, :decimal , :precision => 8, :scale => 2, :default => 0
    change_column :documents, :balance, :decimal , :precision => 8, :scale => 2, :default => 0
    change_column :documents, :recharge, :decimal, :precision => 8, :scale => 2, :default => 0
  end

  def down
    change_column :documents, :annul, :boolean
    change_column :documents, :active, :boolean
    change_column :documents, :amount, :decimal , :precision => 8, :scale => 2
    change_column :documents, :balance, :decimal , :precision => 8, :scale => 2
    change_column :documents, :recharge, :decimal, :precision => 8, :scale => 2
  end
end
