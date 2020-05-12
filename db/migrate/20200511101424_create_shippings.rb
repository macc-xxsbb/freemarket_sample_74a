class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.string "item_name", null: false
      t.integer "ship_base", null: false
      t.string "region", null: false
      t.string "city", null: false
      t.string "block", null: false
      t.string "ship_method", null: false
      t.string "ship_date", null: false
      t.integer "item_id", null: false, foreign_key: true
      t.timestamps
    end
  end
end
