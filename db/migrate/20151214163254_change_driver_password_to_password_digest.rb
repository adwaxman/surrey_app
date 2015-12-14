class ChangeDriverPasswordToPasswordDigest < ActiveRecord::Migration
  def change
    rename_column :drivers, :password, :password_digest
  end
end
