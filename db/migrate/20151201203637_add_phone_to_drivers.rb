class AddPhoneToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :phone, :string
    add_column :drivers, :cell, :string
  end
end
