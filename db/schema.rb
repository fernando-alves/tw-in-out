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

ActiveRecord::Schema.define(version: 20160131015637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "punches", force: :cascade do |t|
    t.datetime "time"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "workday_id"
  end

  add_index "punches", ["user_id"], name: "index_punches_on_user_id", using: :btree
  add_index "punches", ["workday_id"], name: "index_punches_on_workday_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "role"
    t.string   "labor_card"
    t.date     "admission_date"
    t.string   "api_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "workdays", force: :cascade do |t|
    t.date     "day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
