class AddColumnToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :accomodate_pet, :boolean
  end
end
