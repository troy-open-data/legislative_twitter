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

ActiveRecord::Schema.define(version: 20150426171034) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.integer  "bill_id"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "attendances", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "meeting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attendances", ["meeting_id"], name: "index_attendances_on_meeting_id", using: :btree
  add_index "attendances", ["person_id"], name: "index_attendances_on_person_id", using: :btree

  create_table "bills", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "legislation_type", default: "Resolution", null: false
    t.string   "short_title"
  end

  create_table "folios", force: :cascade do |t|
    t.integer  "meeting_id"
    t.integer  "bill_id"
    t.text     "notes"
    t.string   "vote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "folios", ["bill_id"], name: "index_folios_on_bill_id", using: :btree
  add_index "folios", ["meeting_id"], name: "index_folios_on_meeting_id", using: :btree

  create_table "meetings", force: :cascade do |t|
    t.integer  "organization_id"
    t.datetime "date_and_time"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "agenda_approved"
    t.boolean  "minutes_approved"
    t.string   "location"
  end

  add_index "meetings", ["organization_id"], name: "index_meetings_on_organization_id", using: :btree

  create_table "memberships", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "organization_id"
    t.string   "role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "memberships", ["organization_id"], name: "index_memberships_on_organization_id", using: :btree
  add_index "memberships", ["person_id"], name: "index_memberships_on_person_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.integer  "level"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "first"
    t.string   "last"
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sponsorships", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "folio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sponsorships", ["folio_id"], name: "index_sponsorships_on_folio_id", using: :btree
  add_index "sponsorships", ["person_id"], name: "index_sponsorships_on_person_id", using: :btree

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

  add_foreign_key "folios", "bills"
  add_foreign_key "folios", "meetings"
  add_foreign_key "meetings", "organizations"
end
