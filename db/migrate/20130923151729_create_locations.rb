class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :state
      t.string :countri
      t.string :city

      t.timestamps
    end
  end
end
