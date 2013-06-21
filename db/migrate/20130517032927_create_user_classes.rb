class CreateUserClasses < ActiveRecord::Migration
  def change
    create_table :user_classes do |t|
      t.string :classname
      t.string :classdesc

      t.timestamps
    end
  end
end
