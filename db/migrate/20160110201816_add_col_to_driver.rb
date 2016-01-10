class AddColToDriver < ActiveRecord::Migration
  def change
    add_column :drivers, :accommodate_pet, :bool
  end
end
