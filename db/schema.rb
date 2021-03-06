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

ActiveRecord::Schema.define(version: 20150119215311) do

  create_table "api_keys", force: true do |t|
    t.integer  "user_id"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "representative"
    t.string   "nit"
    t.string   "address"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "controller_actions", force: true do |t|
    t.integer  "controller_action_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "controller_actions_roles", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "controller_action_id"
  end

  add_index "controller_actions_roles", ["controller_action_id"], name: "index_controller_actions_roles_on_controller_action_id"
  add_index "controller_actions_roles", ["role_id"], name: "index_controller_actions_roles_on_role_id"

  create_table "coordinates", force: true do |t|
    t.integer  "ride_id"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gps", force: true do |t|
    t.float    "battery"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rides", force: true do |t|
    t.datetime "started_at"
    t.datetime "ended_at"
    t.float    "average_speed"
    t.integer  "vehicle_id"
    t.integer  "user_id"
    t.integer  "gps_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.string   "email"
    t.string   "password"
  end

  create_table "vehicles", force: true do |t|
    t.string   "brand"
    t.string   "model"
    t.string   "license_plate"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
