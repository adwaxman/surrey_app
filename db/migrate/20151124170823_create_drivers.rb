class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
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
      t.string :car_type
      t.boolean :monday
      t.integer :monday_min
      t.integer :monday_max
      t.boolean :tuesday
      t.integer :tuesday_min
      t.integer :tuesday_max
      t.boolean :wednesday
      t.integer :wednesday_min
      t.integer :wednesday_max
      t.boolean :thursday
      t.integer :thursday_min
      t.integer :thursday_max
      t.boolean :friday
      t.integer :friday_min
      t.integer :friday_max
      t.boolean :unavailable
      t.boolean :accommodate_wheelchair
      t.boolean :accommodate_aide
      t.string :preferred_contact

      t.timestamps null: false
    end
  end
end
