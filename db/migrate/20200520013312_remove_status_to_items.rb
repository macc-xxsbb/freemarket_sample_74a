class RemoveStatusToItems < ActiveRecord::Migration[5.2]
  def change

    remove_column :items, :status, :integer, null: false

  end
end
