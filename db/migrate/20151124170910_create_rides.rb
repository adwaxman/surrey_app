class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.integer :client_id
      t.integer :driver_id
      t.integer :origin_id
      t.integer :destination_id
      t.boolean :wheelchair
      t.boolean :aide
      t.boolean :vision_impaired
      t.boolean :hearing_impaired
      t.boolean :recurring
      t.string :status
      t.text :completion_notes
      t.integer :requested_driver
      t.boolean :request_checked


      t.timestamps null: false
    end
  end
end
