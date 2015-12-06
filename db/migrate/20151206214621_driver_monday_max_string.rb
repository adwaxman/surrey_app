class DriverMondayMaxString < ActiveRecord::Migration
  def change
    change_table :drivers do |t|
      t.change :monday_min, :string
      t.change :monday_max, :string
    end
  end
end
