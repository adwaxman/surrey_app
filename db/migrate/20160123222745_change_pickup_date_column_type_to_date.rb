class ChangePickupDateColumnTypeToDate < ActiveRecord::Migration
  def change
    remove_column :rides, :pickup_date
    add_column :rides, :pickup_date, :date
  end
end
