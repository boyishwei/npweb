# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130615030917) do

  create_table "addresses", :force => true do |t|
    t.string   "address"
    t.integer  "user_id"
    t.string   "postcode"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "adds", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "configs", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.string   "remarks"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "order_no"
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "os_id"
    t.datetime "ordertime"
    t.datetime "delivertime"
    t.datetime "paymentime"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.integer  "ordertype"
    t.string   "ship_addr"
    t.string   "ship_no"
    t.string   "remarks"
    t.string   "contact_no"
    t.integer  "amount"
    t.decimal  "total_price", :precision => 10, :scale => 2
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.decimal  "price",      :precision => 10, :scale => 2
    t.integer  "available"
    t.string   "desc"
    t.integer  "inventory"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "user_classes", :force => true do |t|
    t.string   "classname"
    t.string   "classdesc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "phonenum"
    t.string   "email"
    t.date     "birthday"
    t.integer  "admin"
    t.integer  "class_id"
    t.datetime "regtime"
    t.string   "address"
    t.string   "address2"
    t.string   "address3"
    t.string   "address4"
    t.string   "address5"
    t.string   "address6"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
