class AddActiveColToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :active, :boolean
  end
end
