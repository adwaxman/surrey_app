class AddColToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :title, :string
    add_column :settings, :nav, :string
    add_column :settings, :container, :string
    add_column :settings, :cardt, :string
    add_column :settings, :cardbuttontext, :string
    add_column :settings, :cardpanel, :string
  end
end
