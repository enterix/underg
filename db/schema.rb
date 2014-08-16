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

ActiveRecord::Schema.define(version: 20140816025337) do

  create_table "forms", force: true do |t|
    t.date     "age_from"
    t.date     "age_upto"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "game_id"
    t.integer  "user_id"
    t.boolean  "europe"
    t.boolean  "australia"
    t.boolean  "asia"
    t.boolean  "north_america"
    t.boolean  "south_america"
    t.boolean  "africa"
    t.integer  "group_id"
  end

  add_index "forms", ["game_id"], name: "index_forms_on_game_id"
  add_index "forms", ["group_id"], name: "index_forms_on_group_id"
  add_index "forms", ["user_id"], name: "index_forms_on_user_id"

  create_table "games", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "looking"
  end

  create_table "languages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "language_id"
  end

  add_index "languages_users", ["language_id"], name: "index_languages_users_on_language_id"
  add_index "languages_users", ["user_id"], name: "index_languages_users_on_user_id"

  create_table "users", force: true do |t|
    t.string   "nickname"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.date     "date_of_birth"
    t.boolean  "sex"
    t.integer  "worldpart"
  end

end
