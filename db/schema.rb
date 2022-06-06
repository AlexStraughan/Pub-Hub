# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_06_135515) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pub_crawls", force: :cascade do |t|
    t.string "name"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pubs", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stops", force: :cascade do |t|
    t.bigint "pub_id", null: false
    t.bigint "pub_crawl_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pub_crawl_id"], name: "index_stops_on_pub_crawl_id"
    t.index ["pub_id"], name: "index_stops_on_pub_id"
  end

  create_table "user_pub_crawls", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "pub_crawl_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pub_crawl_id"], name: "index_user_pub_crawls_on_pub_crawl_id"
    t.index ["user_id"], name: "index_user_pub_crawls_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "stops", "pub_crawls"
  add_foreign_key "stops", "pubs"
  add_foreign_key "user_pub_crawls", "pub_crawls"
  add_foreign_key "user_pub_crawls", "users"
end
