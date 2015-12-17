class AddDurationColToRides < ActiveRecord::Migration
  def change
    add_column :rides, :duration, :string
  end
end
