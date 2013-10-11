class AddVatIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :vat_id, :integer
  end
end
