class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :fname
      t.string :lname
      t.string :username
      t.string :email
      t.string :password
      t.boolean :super_admin


      t.timestamps null: false
    end
  end
end
