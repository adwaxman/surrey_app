class AddCountyToOrigin < ActiveRecord::Migration
  def change
    add_column :origins, :county, :string

  end
end
