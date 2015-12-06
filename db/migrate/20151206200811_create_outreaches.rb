class CreateOutreaches < ActiveRecord::Migration
  def change
    create_table :outreaches do |t|
      t.integer :driver_id
      t.string :ride_id
      t.string :integer
      t.string :contact_method
      t.string :string
      t.string :result
      t.string :string
      t.string :admin_id
      t.string :integer

      t.timestamps null: false
    end
  end
end
