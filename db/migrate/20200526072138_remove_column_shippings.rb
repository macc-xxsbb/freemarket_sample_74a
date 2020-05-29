class RemoveColumnShippings < ActiveRecord::Migration[5.2]
  def change
    remove_column :shippings, :ship_base,    :integer
  end
end
