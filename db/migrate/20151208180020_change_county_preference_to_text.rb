class ChangeCountyPreferenceToText < ActiveRecord::Migration
  def change
        change_column :drivers, :county_preference, :text
  end
end
