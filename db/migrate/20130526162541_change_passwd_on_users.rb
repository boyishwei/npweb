class ChangePasswdOnUsers < ActiveRecord::Migration
  def up
      rename_column :users, :passwd, :password_digest
  end

  def down
      rename_column :users, :password_digest, :passwd
  end
end
