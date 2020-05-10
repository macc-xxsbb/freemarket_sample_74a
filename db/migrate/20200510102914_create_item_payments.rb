class CreateItemPayments < ActiveRecord::Migration[5.2]
  def change
    create_table :item_payments do |t|
      t.string "item", null: false
      t.string "pay", null: false
      t.string "pay_method", null: false
      t.string "shipping", null: false
      t.timestamps
    end
  end
end
