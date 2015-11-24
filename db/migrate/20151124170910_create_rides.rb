class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.client_id :integer
      t.driver_id :integer
      t.origin_id :integer
      t.destination_id :integer
      t.wheelchair :boolean
      t.aide :boolean
      t.vision_impaired :boolean
      t.hearing_impaired :boolean
      t.recurring :boolean
      t.status :string
      t.completion_notes :text
      t.requested_driver :integer
      t.request_checked :boolean


      t.timestamps null: false
    end
  end
end
