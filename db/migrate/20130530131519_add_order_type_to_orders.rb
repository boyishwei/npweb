class AddOrderTypeToOrders < ActiveRecord::Migration
  def change
	add_column :orders, :ordertype, :integer
  end
end
