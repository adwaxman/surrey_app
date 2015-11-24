class AddColumns < ActiveRecord::Migration
  def change
    add_column :rides, :pickup_time, :string
    add_column :rides, :pickup_date, :string
  end
end
