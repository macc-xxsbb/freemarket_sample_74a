class RenameShipDateColumnToShippings < ActiveRecord::Migration[5.2]
  def change
    rename_column :shippings, :ship_date, :ship_date_id
  end
end
