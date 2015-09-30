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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(version: 20_130_429_192_718) do
  create_table 'punches', force: true do |t|
    t.datetime 'time'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'workday_id'
  end

  add_index 'punches', ['user_id'], name: 'index_punches_on_user_id'
  add_index 'punches', ['workday_id'], name: 'index_punches_on_workday_id'

  create_table 'users', force: true do |t|
    t.string 'email',              default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.datetime 'created_at',                         null: false
    t.datetime 'updated_at',                         null: false
    t.string 'name'
    t.string 'role'
    t.string 'labor_card'
    t.date 'admission_date'
  end

  add_index 'users', ['email'], name: 'index_users_on_email', unique: true

  create_table 'workdays', force: true do |t|
    t.date 'day'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
