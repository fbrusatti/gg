class AddInvoiceIdAndReceiptIdToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :invoice_id, :integer
    add_column :payments, :receipt_id, :integer
  end
end
