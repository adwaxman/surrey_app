class AddFullnameColToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :full_name, :string
  end
end
