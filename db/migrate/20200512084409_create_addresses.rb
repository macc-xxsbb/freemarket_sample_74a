class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :prefecture_id
      t.string :city
      t.integer :zipcode
      t.text :address
      t.references :user

      t.timestamps
    end
  end
end
