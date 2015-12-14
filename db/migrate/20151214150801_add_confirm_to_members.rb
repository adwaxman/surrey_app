class AddConfirmToMembers < ActiveRecord::Migration
  def change
    add_column :members, :confirmed, :string
  end
end
