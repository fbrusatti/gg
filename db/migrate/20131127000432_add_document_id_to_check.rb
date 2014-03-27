class AddDocumentIdToCheck < ActiveRecord::Migration
  def change
    add_column :checks, :document_id, :integer
  end
end
