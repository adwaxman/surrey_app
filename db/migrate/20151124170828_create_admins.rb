class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.fname :string
      t.lname :string
      t.username :string
      t.email :string
      t.password :string
      t.super_admin :boolean


      t.timestamps null: false
    end
  end
end
