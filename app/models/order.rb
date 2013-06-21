class Order < ActiveRecord::Base
  attr_accessible :delivertime, :order_no, :os_id, :ordertime, :paymentime, :product_id, :user_id, :ship_addr, :remarks
end
