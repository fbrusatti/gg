class ChangeColumnTypeInDocuments < ActiveRecord::Migration
  def up
    change_column :documents, :number,  'integer USING CAST(number AS integer)'
    execute 'CREATE SEQUENCE number_no_seq START 1'
  end

  def down
    change_column :documents, :number, :string
    execute 'DROP SEQUENCE IF EXISTS number_no_seq;'
  end
end
