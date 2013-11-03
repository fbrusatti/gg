class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
    t.string :name
    t.string :branch_office_number
    t.string :address
    t.references :location
    t.timestamps
    end
    add_index :banks, :name
    add_index :banks, :branch_office_number
  end
end
