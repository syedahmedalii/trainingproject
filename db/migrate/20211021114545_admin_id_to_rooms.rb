class AdminIdToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :admin_id, :integer
    add_column :rooms, :receiving_id, :integer
  end
end
