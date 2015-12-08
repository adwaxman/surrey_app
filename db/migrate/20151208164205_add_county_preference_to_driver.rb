class AddCountyPreferenceToDriver < ActiveRecord::Migration
  def change
    add_column :drivers, :county_preference, :string
  end
end
