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

ActiveRecord::Schema.define(version: 20140410003056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chapters", force: true do |t|
    t.string   "title"
    t.integer  "trip_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "inspiration_id"
    t.integer  "position"
  end

  create_table "inspirations", force: true do |t|
    t.integer "user_id"
    t.integer "inspirable_id"
    t.string  "inspirable_type"
  end

  create_table "plan_items", force: true do |t|
    t.integer  "trip_plan_id"
    t.string   "title"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
    t.decimal  "longitude",    precision: 9, scale: 6
    t.decimal  "latitude",     precision: 9, scale: 6
  end

  create_table "post_attachments", force: true do |t|
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "postimage"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "date"
    t.integer  "chapter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
    t.decimal  "longitude",      precision: 9, scale: 6
    t.decimal  "latitude",       precision: 9, scale: 6
    t.string   "postimage"
    t.integer  "inspiration_id"
  end

  create_table "trip_plans", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cached_votes_total", default: 0
    t.integer  "coverphoto"
    t.integer  "inspiration_id"
  end

  add_index "trips", ["cached_votes_total"], name: "index_trips_on_cached_votes_total", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",                         null: false
    t.string   "email",                        null: false
    t.string   "bio",                          null: false
    t.string   "crypted_password",             null: false
    t.string   "salt",                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree

end
