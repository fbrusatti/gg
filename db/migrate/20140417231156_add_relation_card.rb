class AddRelationCard < ActiveRecord::Migration
  def up
    add_column :cards, :document_id, :integer
    add_index :cards, :document_id
  end

  def down
    remove_column :cards, :document_id
  end
end
