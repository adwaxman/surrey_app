class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :ride_id
      t.integer :matcher_id

      t.timestamps null: false
    end
  end
end
