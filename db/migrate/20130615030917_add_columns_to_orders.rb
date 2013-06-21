class AddColumnsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :amount, :integer
    add_column :orders, :total_price, 'decimal(10,2)'
  end
end
