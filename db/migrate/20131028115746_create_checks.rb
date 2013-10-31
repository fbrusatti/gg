class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.string :check_number
      t.string :account
      t.date :emission_date
      t.date :payment_date
      t.string :emisor
      t.decimal :amount, precision: 8, scale: 2
      t.string :check_status
      t.boolean :is_proper
      t.references :bank
      t.timestamps
    end
    add_index :checks, :emisor
    add_index :checks, :check_number
  end
end
