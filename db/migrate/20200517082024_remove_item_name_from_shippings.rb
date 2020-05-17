class RemoveItemNameFromShippings < ActiveRecord::Migration[5.2]
  def change
    remove_column :shippings, :item_name, :string
  end
end
