class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address
      t.integer :user_id
      t.string :adress
      t.string :postcode

      t.timestamps
    end
  end
end
