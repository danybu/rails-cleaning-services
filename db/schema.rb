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

ActiveRecord::Schema.define(version: 2019_03_07_102327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cleaners", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "average_rating"
    t.integer "age"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_url"
    t.text "address"
    t.float "latitude"
    t.float "longitude"
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "reserved_on"
    t.string "status"
    t.bigint "user_id"
    t.bigint "cleaner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "reserved_until"
    t.index ["cleaner_id"], name: "index_reservations_on_cleaner_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "reservation_id"
    t.index ["reservation_id"], name: "index_reviews_on_reservation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "reservations", "cleaners"
  add_foreign_key "reservations", "users"
  add_foreign_key "reviews", "reservations"
end
