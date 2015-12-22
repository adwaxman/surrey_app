class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :drivers, :accomodate_pet, :accommodate_pet
  end
end
