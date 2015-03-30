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

ActiveRecord::Schema.define(version: 20150330175903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: true do |t|
    t.string  "time_zone"
    t.string  "address_representation"
    t.integer "code"
    t.string  "iso_code"
    t.string  "name"
  end

  create_table "country_languages", force: true do |t|
    t.integer "country_id"
    t.integer "language_id"
  end

  add_index "country_languages", ["country_id"], name: "index_country_languages_on_country_id", using: :btree
  add_index "country_languages", ["language_id"], name: "index_country_languages_on_language_id", using: :btree

  create_table "friendships", force: true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.boolean  "tandem"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "mail_messages", force: true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string "language"
    t.string "text"
  end

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.string   "nickname"
    t.string   "name"
    t.string   "lastname"
    t.integer  "language_id"
    t.string   "telf"
    t.date     "birthdate"
    t.string   "question"
    t.string   "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "gender",             default: "m"
    t.text     "about"
    t.string   "slug"
  end

  add_index "profiles", ["language_id"], name: "index_profiles_on_language_id", using: :btree
  add_index "profiles", ["slug"], name: "index_profiles_on_slug", unique: true, using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "user_languages", force: true do |t|
    t.integer  "user_id"
    t.integer  "language_id"
    t.string   "level"
    t.boolean  "learn"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_languages", ["language_id"], name: "index_user_languages_on_language_id", using: :btree
  add_index "user_languages", ["user_id"], name: "index_user_languages_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
