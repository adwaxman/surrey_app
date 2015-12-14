class AddConfirmToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :confirmed, :boolean
  end
end
