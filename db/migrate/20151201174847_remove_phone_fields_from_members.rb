class RemovePhoneFieldsFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :area_code, :string
    remove_column :members, :local_exchange, :string
    remove_column :members, :phone_ending, :string
    remove_column :members, :primaryEC_area_code, :string
    remove_column :members, :primaryEC_local_exchange, :string
    remove_column :members, :primaryEC_phone_ending, :string
    remove_column :members, :secondaryEC_area_code, :string
    remove_column :members, :secondaryEC_local_exchange, :string
    remove_column :members, :secondaryEC_phone_ending, :string
    remove_column :members, :tertiaryEC_area_code, :string
    remove_column :members, :tertiaryEC_phone_ending, :string
  end
end
