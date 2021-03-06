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

ActiveRecord::Schema.define(version: 20160125053459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "github_tokens", force: :cascade do |t|
    t.string   "username"
    t.string   "token"
    t.boolean  "claimed",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repositories", force: :cascade do |t|
    t.integer  "github_id"
    t.string   "name"
    t.string   "full_name"
    t.string   "description"
    t.boolean  "fork"
    t.string   "html_url"
    t.string   "api_url"
    t.string   "organization"
    t.string   "owner"
    t.string   "language"
    t.integer  "watchers_count"
    t.integer  "subscribers_count"
    t.integer  "forks"
    t.integer  "open_issues_count"
    t.integer  "network_count"
    t.integer  "size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_synced_at"
  end

end
