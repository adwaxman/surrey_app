class DriverMondayMaxString < ActiveRecord::Migration
  def change
    change_table :drivers do |t|
      t.change :monday_min, :time
      t.change :monday_max, :time
    end
  end
end
