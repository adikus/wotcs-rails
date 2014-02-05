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

ActiveRecord::Schema.define(version: 20140205022648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "changes", force: true do |t|
    t.integer  "clan_id",        limit: 8
    t.integer  "player_id",      limit: 8
    t.boolean  "joined"
    t.datetime "changed_at"
    t.datetime "changed_at_max"
  end

  add_index "changes", ["clan_id"], name: "clan_id_changes_ix", using: :btree
  add_index "changes", ["player_id"], name: "player_id_ix", using: :btree

  create_table "clans", force: true do |t|
    t.text     "description"
    t.string   "motto"
    t.string   "name"
    t.string   "tag"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_stats", force: true do |t|
    t.float    "battles"
    t.float    "wins"
    t.float    "defeats"
    t.float    "survived"
    t.float    "frags"
    t.float    "spotted"
    t.float    "accuracy"
    t.float    "damage"
    t.float    "capture"
    t.float    "defence"
    t.float    "experience"
    t.float    "wn7"
    t.float    "wn8"
    t.float    "efficiency"
    t.float    "sc3"
    t.integer  "stat_type"
    t.integer  "player_id",    limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "average_tier"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.integer  "clan_id",    limit: 8
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["clan_id"], name: "clan_id_ix", using: :btree

  create_table "test", id: false, force: true do |t|
    t.integer "id"
    t.integer "val"
  end

end
