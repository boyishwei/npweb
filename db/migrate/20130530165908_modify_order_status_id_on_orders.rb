class ModifyOrderStatusIdOnOrders < ActiveRecord::Migration
  def up
	rename_column :orders, :orderstatus_id, :os_id
  end

  def down
	rename_column :orders, :os_id, :orderstatus_id
  end
end
