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

ActiveRecord::Schema.define(version: 20160825161859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challengeoptions", force: :cascade do |t|
    t.string   "description"
    t.integer  "points"
    t.integer  "challenge_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["challenge_id"], name: "index_challengeoptions_on_challenge_id", using: :btree
  end

  create_table "challenges", force: :cascade do |t|
    t.string   "challenges"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gameparticipations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_gameparticipations_on_game_id", using: :btree
    t.index ["user_id"], name: "index_gameparticipations_on_user_id", using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "num_of_players"
    t.integer  "num_of_bars"
    t.datetime "date_time"
  end

  create_table "members", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "game_id"
    t.index ["game_id"], name: "index_members_on_game_id", using: :btree
    t.index ["team_id"], name: "index_members_on_team_id", using: :btree
    t.index ["user_id"], name: "index_members_on_user_id", using: :btree
  end

  create_table "placegames", force: :cascade do |t|
    t.integer  "place_id"
    t.integer  "game_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "challenge_id"
    t.index ["challenge_id"], name: "index_placegames_on_challenge_id", using: :btree
    t.index ["game_id"], name: "index_placegames_on_game_id", using: :btree
    t.index ["place_id"], name: "index_placegames_on_place_id", using: :btree
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "total_points"
    t.integer  "game_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["game_id"], name: "index_teams_on_game_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "challengeoptions", "challenges"
  add_foreign_key "gameparticipations", "games"
  add_foreign_key "gameparticipations", "users"
  add_foreign_key "members", "games"
  add_foreign_key "members", "teams"
  add_foreign_key "members", "users"
  add_foreign_key "placegames", "challenges"
  add_foreign_key "placegames", "games"
  add_foreign_key "placegames", "places"
  add_foreign_key "teams", "games"
end
