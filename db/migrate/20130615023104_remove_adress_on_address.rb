class RemoveAdressOnAddress < ActiveRecord::Migration
  def up
	remove_column :addresses, :adress
  end

  def down
  end
end
