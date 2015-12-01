class AddMiToMembers < ActiveRecord::Migration
  def change
    add_column :members, :mi, :string
  end
end
