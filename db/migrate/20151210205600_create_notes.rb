class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :admin_id
      t.integer :driver_id
      t.integer :ride_id
      t.text :body

      t.timestamps null: false
    end
  end
end
