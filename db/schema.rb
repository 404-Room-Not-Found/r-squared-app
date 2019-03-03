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

ActiveRecord::Schema.define(version: 2019_01_04_012155) do

  create_table "bookings", force: :cascade do |t|
    t.string "building_name"
    t.integer "room_id"
    t.integer "booker_id"
    t.string "booker_name"
    t.datetime "time_start"
    t.datetime "time_end"
    t.boolean "privatereason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "building_name"
    t.string "roomtype"
    t.integer "room_id"
    t.text "description"
    t.boolean "booked"
    t.string "booker"
    t.time "operate_start"
    t.time "operate_end"
    t.string "tech"
    t.string "numpeople"
    t.string "arrangement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "usertype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
