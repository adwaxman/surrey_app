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

ActiveRecord::Schema.define(version: 20160125013601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "super_admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "full_name"
    t.boolean  "active"
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
    t.string   "county"
  end

  add_index "destinations", ["member_id"], name: "index_destinations_on_member_id", using: :btree

  create_table "drivers", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "password_digest"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "car_type"
    t.boolean  "monday"
    t.boolean  "tuesday"
    t.boolean  "wednesday"
    t.boolean  "thursday"
    t.boolean  "friday"
    t.boolean  "unavailable"
    t.boolean  "accommodate_wheelchair"
    t.boolean  "accommodate_aide"
    t.string   "preferred_contact"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "phone"
    t.string   "cell"
    t.time     "monday_min"
    t.time     "monday_max"
    t.time     "tuesday_min"
    t.time     "tuesday_max"
    t.time     "wednesday_min"
    t.time     "wednesday_max"
    t.time     "thursday_min"
    t.time     "thursday_max"
    t.time     "friday_min"
    t.time     "friday_max"
    t.text     "county_preference"
    t.string   "full_name"
    t.boolean  "private"
    t.boolean  "confirmed"
    t.boolean  "active"
    t.string   "prefered_contact"
    t.boolean  "accommodate_pet"
  end

  create_table "matchers", force: :cascade do |t|
    t.integer  "driver_id"
    t.integer  "match_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "matchers", ["driver_id"], name: "index_matchers_on_driver_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.integer  "ride_id"
    t.integer  "matcher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "matches", ["matcher_id"], name: "index_matches_on_matcher_id", using: :btree
  add_index "matches", ["ride_id"], name: "index_matches_on_ride_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "password_digest"
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
    t.string   "full_name"
    t.boolean  "confirmed"
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "admin_id"
    t.integer  "driver_id"
    t.integer  "ride_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "notes", ["admin_id"], name: "index_notes_on_admin_id", using: :btree
  add_index "notes", ["driver_id"], name: "index_notes_on_driver_id", using: :btree
  add_index "notes", ["ride_id"], name: "index_notes_on_ride_id", using: :btree

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
    t.string   "county"
  end

  add_index "origins", ["member_id"], name: "index_origins_on_member_id", using: :btree

  create_table "outreaches", force: :cascade do |t|
    t.integer  "driver_id"
    t.integer  "ride_id"
    t.string   "contact_method"
    t.string   "result"
    t.integer  "admin_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "outreaches", ["admin_id"], name: "index_outreaches_on_admin_id", using: :btree
  add_index "outreaches", ["driver_id"], name: "index_outreaches_on_driver_id", using: :btree
  add_index "outreaches", ["ride_id"], name: "index_outreaches_on_ride_id", using: :btree

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
    t.time     "pickup_time"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "assigned_by"
    t.string   "duration"
    t.boolean  "pet"
    t.date     "pickup_date"
  end

  add_index "rides", ["destination_id"], name: "index_rides_on_destination_id", using: :btree
  add_index "rides", ["driver_id"], name: "index_rides_on_driver_id", using: :btree
  add_index "rides", ["member_id"], name: "index_rides_on_member_id", using: :btree
  add_index "rides", ["origin_id"], name: "index_rides_on_origin_id", using: :btree

end
