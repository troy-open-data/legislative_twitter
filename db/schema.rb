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

ActiveRecord::Schema.define(version: 20150430170320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

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
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "legislation_type", default: "Resolution", null: false
    t.string   "short_title"
    t.string   "enacting_formula"
  end

  create_table "levels", force: :cascade do |t|
    t.text     "text"
    t.string   "heading"
    t.string   "subheading"
    t.text     "chapeau"
    t.text     "continuation"
    t.string   "type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "bill_id"
    t.integer  "level_id"
  end

  add_index "levels", ["bill_id"], name: "index_levels_on_bill_id", using: :btree
  add_index "levels", ["level_id"], name: "index_levels_on_level_id", using: :btree

  create_table "meeting_items", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "meeting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "meeting_items", ["meeting_id"], name: "index_meeting_items_on_meeting_id", using: :btree

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

  create_table "motions", force: :cascade do |t|
    t.integer  "meeting_id"
    t.integer  "bill_id"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "motions", ["bill_id"], name: "index_motions_on_bill_id", using: :btree
  add_index "motions", ["meeting_id"], name: "index_motions_on_meeting_id", using: :btree

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

  create_table "recitals", force: :cascade do |t|
    t.string   "clause"
    t.string   "prefix"
    t.integer  "bill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recitals", ["bill_id"], name: "index_recitals_on_bill_id", using: :btree

  create_table "roll_call_votes", force: :cascade do |t|
    t.string   "type"
    t.text     "notes"
    t.integer  "motion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roll_call_votes", ["motion_id"], name: "index_roll_call_votes_on_motion_id", using: :btree

  create_table "roll_calls", force: :cascade do |t|
    t.string   "type"
    t.text     "notes"
    t.integer  "motion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roll_calls", ["motion_id"], name: "index_roll_calls_on_motion_id", using: :btree

  create_table "sponsorships", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "motion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sponsorships", ["motion_id"], name: "index_sponsorships_on_motion_id", using: :btree
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

  create_table "votes", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "motion_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "data"
    t.integer  "roll_call_id"
  end

  add_index "votes", ["motion_id"], name: "index_votes_on_motion_id", using: :btree
  add_index "votes", ["person_id"], name: "index_votes_on_person_id", using: :btree
  add_index "votes", ["roll_call_id"], name: "index_votes_on_roll_call_id", using: :btree

  add_foreign_key "levels", "bills"
  add_foreign_key "levels", "levels"
  add_foreign_key "meeting_items", "meetings"
  add_foreign_key "meetings", "organizations"
  add_foreign_key "motions", "bills"
  add_foreign_key "motions", "meetings"
  add_foreign_key "recitals", "bills"
  add_foreign_key "roll_call_votes", "motions"
  add_foreign_key "roll_calls", "motions"
  add_foreign_key "votes", "motions"
  add_foreign_key "votes", "people"
  add_foreign_key "votes", "roll_calls"
end
