class AddCellPhonesToMembers < ActiveRecord::Migration
  def change
    add_column :members, :cell, :string
    add_column :members, :primaryEC_cell, :string
    add_column :members, :secondaryEC_cell, :string
    add_column :members, :tertiaryEC_cell, :string
  end
end
