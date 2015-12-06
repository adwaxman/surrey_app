class CreateMatchers < ActiveRecord::Migration
  def change
    create_table :matchers do |t|
      t.integer :driver_id
      t.integer :match_num

      t.timestamps null: false
    end
  end
end
