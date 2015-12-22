class AddColumnToRides < ActiveRecord::Migration
  def change
    add_column :rides, :pet, :boolean
  end
end
