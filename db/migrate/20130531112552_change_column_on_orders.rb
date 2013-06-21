class ChangeColumnOnOrders < ActiveRecord::Migration
  def up
	add_column :orders, :ship_no, :string
  end

  def down
	delete_column :orders, :ship_no, :string
  end
end
