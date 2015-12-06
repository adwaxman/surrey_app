class ChangeDataTypeAllWeek < ActiveRecord::Migration
  def change
    remove_column :drivers, :tuesday_min
    add_column :drivers, :tuesday_min, :time

    remove_column :drivers, :tuesday_max
    add_column :drivers, :tuesday_max, :time

    remove_column :drivers, :wednesday_min
    add_column :drivers, :wednesday_min, :time

    remove_column :drivers, :wednesday_max
    add_column :drivers, :wednesday_max, :time

    remove_column :drivers, :thursday_min
    add_column :drivers, :thursday_min, :time

    remove_column :drivers, :thursday_max
    add_column :drivers, :thursday_max, :time

    remove_column :drivers, :friday_min
    add_column :drivers, :friday_min, :time

    remove_column :drivers, :friday_max
    add_column :drivers, :friday_max, :time
  end
end
