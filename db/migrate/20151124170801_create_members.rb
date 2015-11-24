class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password
      t.string :area_code
      t.string :local_exchange
      t.string :phone_ending
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.string :zip
      t.string :primaryEC_fname
      t.string :primaryEC_lname
      t.string :primaryEC_area_code
      t.string :primaryEC_local_exchange
      t.string :primaryEC_phone_ending
      t.string :primaryEC_relationship
      t.string :secondaryEC_fname
      t.string :secondaryEC_lname
      t.string :secondaryEC_area_code
      t.string :secondaryEC_local_exchange
      t.string :secondaryEC_phone_ending
      t.string :secondaryEC_relationship
      t.string :tertiaryEC_fname
      t.string :tertiaryEC_lname
      t.string :tertiaryEC_area_code
      t.string :tertiaryEC_local_exchange
      t.string :tertiaryEC_phone_ending
      t.string :tertiaryEC_relationship
      t.boolean :active


      t.timestamps null: false
    end
  end
end
