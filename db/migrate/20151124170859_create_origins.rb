class CreateOrigins < ActiveRecord::Migration
  def change
    create_table :origins do |t|
      t.client_id :integer
      t.address_line1 :string
      t.address_line2 :string
      t.city :string
      t.state :string
      t.zip :string
      t.primary :boolean

      t.timestamps null: false
    end
  end
end
