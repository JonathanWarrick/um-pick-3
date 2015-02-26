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

ActiveRecord::Schema.define(version: 20150226210218) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guesses", force: :cascade do |t|
    t.integer  "submission_id"
    t.integer  "song_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "is_cover",      default: false
    t.boolean  "is_opener",     default: false
  end

  add_index "guesses", ["song_id"], name: "index_guesses_on_song_id", using: :btree
  add_index "guesses", ["submission_id", "song_id"], name: "index_guesses_on_submission_id_and_song_id", unique: true, using: :btree
  add_index "guesses", ["submission_id"], name: "index_guesses_on_submission_id", using: :btree

  create_table "shows", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "date_of_show"
    t.string   "show_venue"
    t.string   "show_city"
    t.string   "show_state"
    t.string   "show_country"
    t.text     "songs_played",              array: true
  end

  create_table "song_shows", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "song_id"
    t.integer  "show_id"
  end

  add_index "song_shows", ["show_id"], name: "index_song_shows_on_show_id", using: :btree
  add_index "song_shows", ["song_id", "show_id"], name: "index_song_shows_on_song_id_and_show_id", unique: true, using: :btree
  add_index "song_shows", ["song_id"], name: "index_song_shows_on_song_id", using: :btree

  create_table "songs", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "song_name"
    t.string   "song_artist"
    t.integer  "times_played"
    t.datetime "debut_date"
    t.datetime "last_played_date"
  end

  create_table "submissions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "show_id"
  end

  add_index "submissions", ["user_id"], name: "index_submissions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "submissions", "users"
end
