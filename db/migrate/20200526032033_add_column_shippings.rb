class AddColumnShippings < ActiveRecord::Migration[5.2]
  def change
    add_column :shippings, :ship_base_id,  :integer
  end
end
