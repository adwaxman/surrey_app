class AddIndexToTables < ActiveRecord::Migration
  def change
    add_index :matchers, :driver_id
    add_index :matches, :ride_id
    add_index :matches, :matcher_id
    add_index :notes, :admin_id
    add_index :notes, :driver_id
    add_index :notes, :ride_id
    add_index :origins, :member_id
    add_index :outreaches, :driver_id
    add_index :outreaches, :ride_id
    add_index :outreaches, :admin_id
    add_index :rides, :member_id
    add_index :rides, :driver_id
    add_index :rides, :origin_id
    add_index :rides, :destination_id
  end
end
