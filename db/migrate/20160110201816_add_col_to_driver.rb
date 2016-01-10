class AddColToDriver < ActiveRecord::Migration
  def change
    add_column :drivers, :accommodate_pet, :bool
    add_column :drivers, :accommodate_aide, :bool
  end
end
