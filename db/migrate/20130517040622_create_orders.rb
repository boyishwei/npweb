class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :ordernum
      t.integer :user_id
      t.integer :product_id
      t.integer :orderstatus_id
      t.datetime :ordertime
      t.datetime :delivertime
      t.datetime :paymentime

      t.timestamps
    end
  end
end
