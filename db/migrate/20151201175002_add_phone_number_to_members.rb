class AddPhoneNumberToMembers < ActiveRecord::Migration
  def change
    add_column :members, :phone, :string
    add_column :members, :primaryEC_phone, :string
    add_column :members, :secondaryEC_phone, :string
    add_column :members, :tertiaryEC_phone, :string
  end
end
