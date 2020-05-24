class ChangeColumnNull < ActiveRecord::Migration[5.2]
  def up
    change_column_null :shippings, :region, true
  end

  def down
    change_column_null :shippings, :region, false
  end
end
