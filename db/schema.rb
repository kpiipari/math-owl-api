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

ActiveRecord::Schema.define(version: 20180426195326) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addition_games", force: :cascade do |t|
    t.jsonb    "rounds"
    t.integer  "score"
    t.time     "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "additions", force: :cascade do |t|
    t.integer  "score"
    t.time     "time"
    t.jsonb    "round1"
    t.jsonb    "round2"
    t.jsonb    "round3"
    t.jsonb    "round4"
    t.jsonb    "round5"
    t.jsonb    "round6"
    t.jsonb    "round7"
    t.jsonb    "round8"
    t.jsonb    "round9"
    t.jsonb    "round10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "rank"
    t.integer  "total_score"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
