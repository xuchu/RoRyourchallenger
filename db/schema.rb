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

ActiveRecord::Schema.define(version: 20140509043250) do

  create_table "accounts", force: true do |t|
  end

  create_table "cities", force: true do |t|
    t.string  "city_name", null: false
    t.integer "state_id",  null: false
  end

  create_table "countries", force: true do |t|
    t.string "country_name", null: false
  end

  create_table "locations", force: true do |t|
    t.integer "postcode_id"
    t.integer "city_id",     null: false
    t.integer "state_id",    null: false
    t.integer "country_id",  null: false
    t.integer "user_id",     null: false
  end

  create_table "postcodes", force: true do |t|
    t.integer "code",    null: false
    t.integer "city_id", null: false
  end

  create_table "states", force: true do |t|
    t.string  "state_name", null: false
    t.integer "country_id", null: false
    t.string  "state_abb"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_digest",                     null: false
    t.string   "email",                               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.boolean  "email_actived",       default: false
    t.string   "username"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
