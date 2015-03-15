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

ActiveRecord::Schema.define(version: 20150315215122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.integer  "legislation_id"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "dockets", force: :cascade do |t|
    t.integer  "meeting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dockets", ["meeting_id"], name: "index_dockets_on_meeting_id", using: :btree

  create_table "legislations", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "legislation_type", default: "Resolution", null: false
    t.string   "short_title"
  end

  create_table "meetings", force: :cascade do |t|
    t.integer  "organization_id"
    t.date     "date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "docket_id"
  end

  add_index "meetings", ["docket_id"], name: "index_meetings_on_docket_id", using: :btree
  add_index "meetings", ["organization_id"], name: "index_meetings_on_organization_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.integer  "level"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "snippets", force: :cascade do |t|
    t.integer  "docket_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "snippets", ["docket_id"], name: "index_snippets_on_docket_id", using: :btree

  create_table "status_updates", force: :cascade do |t|
    t.integer  "legislation_id"
    t.integer  "status_id"
    t.text     "notes"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "status_updates", ["legislation_id"], name: "index_status_updates_on_legislation_id", using: :btree
  add_index "status_updates", ["status_id"], name: "index_status_updates_on_status_id", using: :btree

  create_table "statuses", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "dockets", "meetings"
  add_foreign_key "meetings", "dockets"
  add_foreign_key "meetings", "organizations"
  add_foreign_key "snippets", "dockets"
  add_foreign_key "status_updates", "legislations"
  add_foreign_key "status_updates", "statuses"
end
