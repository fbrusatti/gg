class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :type_card
      t.decimal :amount
      t.string :number
      t.string :name
      t.string :code
      t.date :expirate_at

      t.timestamps
    end
  end
end
