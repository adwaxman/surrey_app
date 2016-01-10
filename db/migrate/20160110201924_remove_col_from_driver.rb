class RemoveColFromDriver < ActiveRecord::Migration
  def change
    remove_column :drivers, :accomodate_pet, :bool
    remove_column :drivers, :accomodate_aide, :bool
  end
end
