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

ActiveRecord::Schema.define(version: 20151206211413) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.boolean  "super_admin"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "destinations", force: :cascade do |t|
    t.integer  "member_id"
    t.string   "name"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "destination_type"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "destination_other_type"
  end

  create_table "drivers", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "password"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "car_type"
    t.boolean  "monday"
    t.string   "monday_min"
    t.string   "monday_max"
    t.boolean  "tuesday"
    t.string   "tuesday_min"
    t.string   "tuesday_max"
    t.boolean  "wednesday"
    t.string   "wednesday_min"
    t.string   "wednesday_max"
    t.boolean  "thursday"
    t.string   "thursday_min"
    t.string   "thursday_max"
    t.boolean  "friday"
    t.string   "friday_min"
    t.string   "friday_max"
    t.boolean  "unavailable"
    t.boolean  "accommodate_wheelchair"
    t.boolean  "accommodate_aide"
    t.string   "preferred_contact"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "phone"
    t.string   "cell"
  end

  create_table "matchers", force: :cascade do |t|
    t.integer  "driver_id"
    t.integer  "match_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "ride_id"
    t.integer  "matcher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "password"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "primaryEC_fname"
    t.string   "primaryEC_lname"
    t.string   "primaryEC_relationship"
    t.string   "secondaryEC_fname"
    t.string   "secondaryEC_lname"
    t.string   "secondaryEC_relationship"
    t.string   "tertiaryEC_fname"
    t.string   "tertiaryEC_lname"
    t.string   "tertiaryEC_local_exchange"
    t.string   "tertiaryEC_relationship"
    t.boolean  "active"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "mi"
    t.string   "phone"
    t.string   "primaryEC_phone"
    t.string   "secondaryEC_phone"
    t.string   "tertiaryEC_phone"
    t.string   "cell"
    t.string   "primaryEC_cell"
    t.string   "secondaryEC_cell"
    t.string   "tertiaryEC_cell"
  end

  create_table "origins", force: :cascade do |t|
    t.integer  "member_id"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.boolean  "primary"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "outreaches", force: :cascade do |t|
    t.integer  "driver_id"
    t.string   "ride_id"
    t.string   "integer"
    t.string   "contact_method"
    t.string   "string"
    t.string   "result"
    t.string   "admin_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "rides", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "driver_id"
    t.integer  "origin_id"
    t.integer  "destination_id"
    t.boolean  "wheelchair"
    t.boolean  "aide"
    t.boolean  "vision_impaired"
    t.boolean  "hearing_impaired"
    t.boolean  "recurring"
    t.string   "status"
    t.text     "completion_notes"
    t.integer  "requested_driver"
    t.boolean  "request_checked"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "pickup_time"
    t.string   "pickup_date"
  end

end
