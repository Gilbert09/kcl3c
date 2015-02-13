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

ActiveRecord::Schema.define(version: 20150212160112) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "property_id",    limit: 4
    t.string   "address_line_1", limit: 255
    t.string   "address_line_2", limit: 255
    t.string   "town_city",      limit: 255
    t.string   "post_code",      limit: 255
    t.string   "county",         limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "listings", force: :cascade do |t|
    t.integer  "property_id", limit: 4
    t.integer  "views",       limit: 4
    t.boolean  "visible",     limit: 1
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "multimedia", force: :cascade do |t|
    t.integer  "property_id",     limit: 4
    t.integer  "index_number",    limit: 4
    t.string   "multimedia_type", limit: 255
    t.string   "name",            limit: 255
    t.string   "caption",         limit: 255
    t.binary   "data",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "properties", force: :cascade do |t|
    t.integer  "user_id",              limit: 4
    t.integer  "price",                limit: 4
    t.integer  "number_of_bedrooms",   limit: 4
    t.integer  "number_of_bathrooms",  limit: 4
    t.integer  "number_of_receptions", limit: 4
    t.string   "kitchen_type",         limit: 255
    t.string   "keyword",              limit: 255
    t.string   "property_type",        limit: 255
    t.string   "status",               limit: 255
    t.string   "parking",              limit: 255
    t.string   "outdoor_spaces",       limit: 255
    t.text     "description",          limit: 65535
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.integer  "property_id",      limit: 4
    t.integer  "multimedia_id",    limit: 4
    t.float    "room_length",      limit: 24
    t.float    "room_width",       limit: 24
    t.string   "room_type",        limit: 255
    t.string   "measurement_unit", limit: 255
    t.text     "description",      limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "title",                  limit: 255
    t.string   "phone_number",           limit: 255
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
