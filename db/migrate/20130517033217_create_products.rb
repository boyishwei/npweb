class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.integer :available
      t.string :desc
      t.integer :inventory

      t.timestamps
    end
  end
end
