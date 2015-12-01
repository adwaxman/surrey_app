class RemovePhoneStuffFromDriver < ActiveRecord::Migration
  def change
    remove_column :drivers, :area_code, :string
    remove_column :drivers, :local_exchange, :string
    remove_column :drivers, :phone_ending, :string
  end
end
