class AddColToDestinations < ActiveRecord::Migration
  def change
    add_column :destinations, :destination_other_type, :string
  end
end
