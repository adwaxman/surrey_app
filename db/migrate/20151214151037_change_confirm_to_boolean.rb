class ChangeConfirmToBoolean < ActiveRecord::Migration
  def change
    remove_column :members, :confirmed
    add_column :members, :confirmed, :boolean
  end
end
