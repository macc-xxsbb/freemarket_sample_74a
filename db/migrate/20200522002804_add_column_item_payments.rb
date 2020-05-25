class AddColumnItemPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :item_payments, :item_id,  :integer
    add_column :item_payments, :saler_id, :integer
    add_column :item_payments, :buyer_id, :integer
  end
end
