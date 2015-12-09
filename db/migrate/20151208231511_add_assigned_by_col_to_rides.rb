class AddAssignedByColToRides < ActiveRecord::Migration
  def change
    add_column :rides, :assigned_by, :string
  end
end
