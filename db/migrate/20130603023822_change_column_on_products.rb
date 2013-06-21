class ChangeColumnOnProducts < ActiveRecord::Migration
  def up
	change_column :products, :price, 'decimal(10,2)'
  end

  def down
	change_column :products, :price, :decimal
  end
end
