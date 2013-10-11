class CreateVats < ActiveRecord::Migration
  def change
    create_table :vats do |t|
      t.float :percentaje
      t.date :start_date

      t.timestamps
    end
  end
end
