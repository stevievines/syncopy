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

ActiveRecord::Schema.define(version: 20140909023359) do

  create_table "list_movies", force: true do |t|
    t.integer  "list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "release_date"
    t.integer  "movie_id"
  end

  add_index "list_movies", ["movie_id"], name: "index_list_movies_on_movie_id"

  create_table "lists", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lists", ["user_id"], name: "index_lists_on_user_id"

  create_table "movies", force: true do |t|
    t.string   "backdrop_path"
    t.string   "poster_path"
    t.integer  "budget"
    t.string   "homepage"
    t.integer  "tmdb_id",        null: false
    t.string   "imdb_id"
    t.string   "original_title"
    t.text     "overview"
    t.float    "popularity"
    t.date     "release_date"
    t.integer  "revenue"
    t.integer  "runtime"
    t.string   "status"
    t.string   "tagline"
    t.string   "title",          null: false
    t.float    "vote_average"
    t.integer  "vote_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movies", ["tmdb_id"], name: "index_movies_on_tmdb_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
