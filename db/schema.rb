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

ActiveRecord::Schema.define(version: 20130722033901) do

  create_table "days", force: true do |t|
    t.integer  "user_id",    null: false
    t.date     "date",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "days", ["date"], name: "index_days_on_date"
  add_index "days", ["user_id"], name: "index_days_on_user_id"

  create_table "note_tags", force: true do |t|
    t.integer  "note_id",         null: false
    t.integer  "tag_category_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "note_tags", ["note_id"], name: "index_note_tags_on_note_id"
  add_index "note_tags", ["tag_category_id"], name: "index_note_tags_on_tag_category_id"

  create_table "notes", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "day_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["day_id"], name: "index_notes_on_day_id"
  add_index "notes", ["user_id"], name: "index_notes_on_user_id"

  create_table "tag_categories", force: true do |t|
    t.string   "name",             null: false
    t.integer  "note_tag_id"
    t.integer  "trackable_tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tag_categories", ["name"], name: "index_tag_categories_on_name"
  add_index "tag_categories", ["note_tag_id"], name: "index_tag_categories_on_note_tag_id"
  add_index "tag_categories", ["trackable_tag_id"], name: "index_tag_categories_on_trackable_tag_id"

  create_table "track_categories", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "track_categories", ["name"], name: "index_track_categories_on_name"

  create_table "trackable_tags", force: true do |t|
    t.integer  "trackable_id",    null: false
    t.integer  "tag_category_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trackable_tags", ["tag_category_id"], name: "index_trackable_tags_on_tag_category_id"
  add_index "trackable_tags", ["trackable_id"], name: "index_trackable_tags_on_trackable_id"

  create_table "trackables", force: true do |t|
    t.integer  "user_id"
    t.integer  "day_id"
    t.text     "name"
    t.float    "trackable_qty"
    t.string   "units"
    t.integer  "trackable_tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "track_category_id"
  end

  add_index "trackables", ["day_id"], name: "index_trackables_on_day_id"
  add_index "trackables", ["name"], name: "index_trackables_on_name"
  add_index "trackables", ["trackable_tag_id"], name: "index_trackables_on_trackable_tag_id"
  add_index "trackables", ["user_id"], name: "index_trackables_on_user_id"

  create_table "users", force: true do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.string   "hashed_password", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["last_name"], name: "index_users_on_last_name"

end
