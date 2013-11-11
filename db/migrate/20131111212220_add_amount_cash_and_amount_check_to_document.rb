class AddAmountCashAndAmountCheckToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :amount_cash, :decimal, precision: 8, scale: 2
    add_column :documents, :amount_check, :decimal, precision: 8, scale: 2
  end
end
