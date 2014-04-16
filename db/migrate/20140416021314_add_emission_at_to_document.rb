class AddEmissionAtToDocument < ActiveRecord::Migration
  def up
    add_column :documents, :emission_at, :date
  end

  def down
    remove_column :documents, :emission_at, :date
  end
end
