class ChangeColumnType < ActiveRecord::Migration
  def change
    change_column :drivers, :monday_min, :string
    change_column :drivers, :monday_max, :string
    change_column :drivers, :tuesday_min, :string
    change_column :drivers, :tuesday_max, :string
    change_column :drivers, :wednesday_min, :string
    change_column :drivers, :wednesday_max, :string
    change_column :drivers, :thursday_min, :string
    change_column :drivers, :thursday_max, :string
    change_column :drivers, :friday_min, :string
    change_column :drivers, :friday_max, :string
  end
end
