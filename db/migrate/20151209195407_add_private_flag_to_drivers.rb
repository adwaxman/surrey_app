class AddPrivateFlagToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :private, :boolean
  end
end
