class AddContactNoToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :contact_no, :string
  end
end
