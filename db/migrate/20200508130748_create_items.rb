class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string    :item_name, null: false
      t.integer   :price, null: false
      t.string    :size
      t.text      :content, null: false
      t.integer   :status, null: false
      t.timestamps
    end
  end
end
