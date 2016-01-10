class AddPetToRide < ActiveRecord::Migration
  def change
    add_column :rides, :pet, :bool
  end
end
