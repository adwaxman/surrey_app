class AddColumnToDriver < ActiveRecord::Migration
  def change
    add_column :drivers, :prefered_contact, :string
  end
end
