class CreateOutreaches < ActiveRecord::Migration
  def change
    create_table :outreaches do |t|
      t.integer :driver_id
      t.integer :ride_id
      t.string :contact_method
      t.string :result
      t.integer :admin_id

      t.timestamps null: false
    end
  end
end
