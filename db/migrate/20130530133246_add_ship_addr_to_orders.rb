class AddShipAddrToOrders < ActiveRecord::Migration
  def change
	add_column :orders, :ship_addr,:string
  end
end
