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

ActiveRecord::Schema.define(version: 20160803010535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bags", force: :cascade do |t|
    t.string   "color",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "deliveries", ["user_id"], name: "index_deliveries_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.boolean  "user"
    t.boolean  "agent"
    t.boolean  "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_bags", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bag_id"
    t.integer  "delivery_id"
    t.float    "kg"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_bags", ["bag_id"], name: "index_user_bags_on_bag_id", using: :btree
  add_index "user_bags", ["delivery_id"], name: "index_user_bags_on_delivery_id", using: :btree
  add_index "user_bags", ["user_id"], name: "index_user_bags_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.integer  "role_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "user_id"
    t.string   "uid"
    t.string   "provider"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree
  add_index "users", ["user_id"], name: "index_users_on_user_id", using: :btree

  add_foreign_key "deliveries", "users"
  add_foreign_key "user_bags", "bags"
  add_foreign_key "user_bags", "deliveries"
  add_foreign_key "user_bags", "users"
  add_foreign_key "users", "roles"
  add_foreign_key "users", "users"
end
