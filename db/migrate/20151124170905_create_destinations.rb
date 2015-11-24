class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.client_id :integer
      t.name :string
      t.address_line1 :string
      t.address_line2 :string
      t.city :string
      t.state :string
      t.zip :string
      t.destination_type :string

      t.timestamps null: false
    end
  end
end
