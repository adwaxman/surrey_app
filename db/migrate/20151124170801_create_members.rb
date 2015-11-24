class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.fname :string
      t.lname :string
      t.email :string
      t.password :string
      t.area_code :string
      t.local_exchange :string
      t.phone_ending :string
      t.address_line1 :string
      t.address_line2 :string
      t.city :string
      t.state :string
      t.zip :string
      t.primaryEC_fname :string
      t.primaryEC_lname :string
      t.primaryEC_area_code :string
      t.primaryEC_local_exchange :string
      t.primaryEC_phone_ending :string
      t.primaryEC_relationship :string
      t.secondaryEC_fname :string
      t.secondaryEC_lname :string
      t.secondaryEC_area_code :string
      t.secondaryEC_local_exchange :string
      t.secondaryEC_phone_ending :string
      t.secondaryEC_relationship :string
      t.tertiaryEC_fname :string
      t.tertiaryEC_lname :string
      t.tertiaryEC_area_code :string
      t.tertiaryEC_local_exchange :string
      t.tertiaryEC_phone_ending :string
      t.tertiaryEC_relationship :string
      t.active :boolean


      t.timestamps null: false
    end
  end
end
