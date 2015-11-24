class CreateOrigins < ActiveRecord::Migration
  def change
    create_table :origins do |t|
      t.integer :client_id
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.string :zip
      t.boolean :primary

      t.timestamps null: false
    end
  end
end
