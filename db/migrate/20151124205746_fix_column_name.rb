class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :destinations, :client_id, :member_id
    rename_column :origins, :client_id, :member_id
    rename_column :rides, :client_id, :member_id    
  end
end
