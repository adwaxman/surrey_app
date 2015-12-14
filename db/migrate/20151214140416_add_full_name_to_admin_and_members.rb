class AddFullNameToAdminAndMembers < ActiveRecord::Migration
  def change
    add_column :members, :full_name, :string
    add_column :admins, :full_name, :string
  end
end
