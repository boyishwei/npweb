class AddRemarksOnOrders < ActiveRecord::Migration
  def up
	add_column :orders, :remarks, :string
  end

  def down
	remove_column :orders, :remarks, :string
  end
end
