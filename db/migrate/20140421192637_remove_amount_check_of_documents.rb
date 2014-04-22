class RemoveAmountCheckOfDocuments < ActiveRecord::Migration
  def up
    remove_column :documents, :amount_check
  end

  def down
    remove_column :documents, :amount_check, :decimal, precision: 8, scale: 2
  end
end
