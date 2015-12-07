class AddCountyToDestination < ActiveRecord::Migration
  def change
    add_column :destinations, :county, :string

  end
end
