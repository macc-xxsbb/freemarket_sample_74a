class RemoveRegionFromShippings < ActiveRecord::Migration[5.2]
  def change
    remove_column :shippings, :region, :string
    remove_column :shippings, :city, :string
    remove_column :shippings, :block, :string
  end
end
