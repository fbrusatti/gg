class ChangeAmountsColumnToDefaultZero < ActiveRecord::Migration
  def up
    change_column :documents, :amount_check, :decimal, :default => 0
    change_column :documents, :amount_cash, :decimal, :default => 0
  end
end
