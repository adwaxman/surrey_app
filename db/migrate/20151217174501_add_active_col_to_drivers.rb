class AddActiveColToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :active, :boolean
  end
end
