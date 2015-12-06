class ChangeScheduleToTime < ActiveRecord::Migration
  def change
    remove_column :drivers, :monday_min
    add_column :drivers, :monday_min, :time

    remove_column :drivers, :monday_max
    add_column :drivers, :monday_max, :time
  end
end
