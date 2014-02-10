class AddTypeInvoiceToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :invoice_type, :string
  end
end
