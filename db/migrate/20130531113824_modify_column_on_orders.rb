class ModifyColumnOnOrders < ActiveRecord::Migration
  def up
	rename_column :orders, :ordernum, :order_no
  end

  def down
	rename_column :orders, :order_no, :ordernum
  end
end
