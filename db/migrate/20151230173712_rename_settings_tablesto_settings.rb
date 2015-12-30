class RenameSettingsTablestoSettings < ActiveRecord::Migration
  def change
    rename_table :settings_tables, :settings
  end
end
