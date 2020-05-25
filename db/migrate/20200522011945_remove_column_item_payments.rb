class RemoveColumnItemPayments < ActiveRecord::Migration[5.2]
  def change
    remove_column :item_payments, :item,        :string
    remove_column :item_payments, :pay,         :string
    remove_column :item_payments, :pay_method,  :string
    remove_column :item_payments, :shipping,    :string
  end
end
