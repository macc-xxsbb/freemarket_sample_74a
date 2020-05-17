class ChangeNotNullToShippings < ActiveRecord::Migration[5.2]
  def up
    change_column_null :shippings, :city, true
    change_column_null :shippings, :block, true
    change_column_null :shippings, :ship_method, true
  end

  def down
    change_column_null :shippings, :city, false
    change_column_null :shippings, :block, false
    change_column_null :shippings, :ship_method, false
  end
end
