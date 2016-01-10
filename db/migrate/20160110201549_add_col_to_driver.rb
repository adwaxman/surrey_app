class AddColToDriver < ActiveRecord::Migration
  def change
    add_column :drivers, :accomodate_pet, :bool
    add_column :drivers, :accomodate_aide, :bool
  end
end
