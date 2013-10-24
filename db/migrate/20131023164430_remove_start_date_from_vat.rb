class RemoveStartDateFromVat < ActiveRecord::Migration
  def up
    remove_column :vats, :start_date
  end

  def down
    add_column :vats, :start_date, :date
  end
end
