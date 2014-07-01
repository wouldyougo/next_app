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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140701202407) do

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.integer  "reader_id"
    t.string   "order_status"
    t.datetime "contract_date"
    t.string   "abonent"
    t.string   "address"
    t.string   "phone"
    t.string   "phone_mobile"
    t.datetime "connection_date"
    t.string   "inet_tariff_plan"
    t.string   "inet_device_contract"
    t.integer  "inet_installment_plan"
    t.string   "iptv_tariff_plan"
    t.string   "iptv_device_contract"
    t.integer  "iptv_installment_plan"
    t.string   "passport_series"
    t.string   "passport_number"
    t.datetime "passport_registration_date"
    t.string   "passport_issued_by"
    t.datetime "date_of_birth"
    t.string   "place_of_birth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["reader_id", "updated_at"], name: "index_orders_on_reader_id_and_updated_at"
  add_index "orders", ["user_id", "created_at"], name: "index_orders_on_user_id_and_created_at"

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",                  default: false
    t.boolean  "reader",                 default: false
    t.boolean  "active",                 default: false
    t.string   "phone"
    t.string   "comment"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
