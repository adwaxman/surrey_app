class CreateSettingsTable < ActiveRecord::Migration
  def change
    create_table :settings_tables do |t|
      t.text :message
      t.string :background
    end
  end
end
