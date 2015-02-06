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

ActiveRecord::Schema.define(version: 20150130152615) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "property_id",    limit: 4
    t.string   "address_line_1", limit: 255
    t.string   "address_line_2", limit: 255
    t.string   "town_city",      limit: 255
    t.string   "post_code",      limit: 255
    t.string   "county",         limit: 255
    t.string   "country",        limit: 255
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "listings", force: :cascade do |t|
    t.integer  "property_id", limit: 4
    t.integer  "views",       limit: 4
    t.string   "visible",     limit: 255
    t.datetime "date_listed",        null: false
    t.datetime "date_sold",          null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "multimedia", force: :cascade do |t|
    t.integer  "property_id",     limit: 4
    t.string   "multimedia_type", limit: 255
    t.string   "name",            limit: 255
    t.binary   "data",            limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "properties", force: :cascade do |t|
    t.integer  "user_id",             limit: 4
    t.integer  "price",               limit: 4
    t.integer  "number_bedroom",      limit: 4
    t.integer  "number_bathroom",     limit: 4
    t.integer  "number_reception",    limit: 4
    t.string   "keyword",             limit: 255
    t.string   "description",         limit: 255
    t.string   "property_type",       limit: 255
    t.string   "status",              limit: 255
    t.string   "parking",             limit: 255
    t.string   "outdoor_spaces",      limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "password",   limit: 255
    t.string   "title",      limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
