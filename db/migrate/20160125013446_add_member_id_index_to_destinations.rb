class AddMemberIdIndexToDestinations < ActiveRecord::Migration
  def change
    add_index :destinations, :member_id
  end
end
