class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
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
      t.cartype :string
      t.monday :boolean
      t.monday_min :integer
      t.monday_max :integer
      t.tuesday :boolean
      t.tuesday_min :integer
      t.tuesday_max :integer
      t.wednesday :boolean
      t.wednesday_min :integer
      t.wednesday_max :integer
      t.thursday :boolean
      t.thursday_min :integer
      t.thursday_max :integer
      t.friday :boolean
      t.friday_min :integer
      t.friday_max :integer
      t.unavailable :boolean
      t.accommodate_wheelchair :boolean
      t.accommodate_aide :boolean
      t.preferred_contact :string

      t.timestamps null: false
    end
  end
end
