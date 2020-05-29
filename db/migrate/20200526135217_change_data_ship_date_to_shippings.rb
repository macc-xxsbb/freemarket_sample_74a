class ChangeDataShipDateToShippings < ActiveRecord::Migration[5.2]
  def change
    change_column :shippings, :ship_date, :integer
  end
end
