class AddColumnCreationStateToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :creation_state, :string, default: "init"
    add_index :documents, :creation_state
  end
end
