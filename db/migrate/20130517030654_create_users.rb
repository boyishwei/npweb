class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :passwd
      t.string :phonenum
      t.string :email
      t.date :birthday
      t.integer :admin
      t.integer :class_id
      t.datetime :regtime
      t.string :address
      t.string :address2
      t.string :address3
      t.string :address4
      t.string :address5
      t.string :address6

      t.timestamps
    end
  end
end
