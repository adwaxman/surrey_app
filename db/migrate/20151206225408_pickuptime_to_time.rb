class PickuptimeToTime < ActiveRecord::Migration
  def change
    remove_column :rides, :pickup_time
    add_column :rides, :pickup_time, :time
  end
end
