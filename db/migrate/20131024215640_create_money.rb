class CreateMoney < ActiveRecord::Migration
  def change
    create_table :money do |t|
      t.string :name , :null => false
      t.string :symbol, :null => false
      t.decimal :quotation, precision: 8, scale: 2,:null => false
      t.timestamps
    end
  end
end
