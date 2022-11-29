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

ActiveRecord::Schema[7.0].define(version: 2022_11_29_220828) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string "category"
    t.string "brand"
    t.string "model"
    t.integer "year"
    t.string "color"
    t.integer "number_of_seats"
    t.integer "number_of_doors"
    t.integer "engine_size"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
    t.string "location"
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "car_id", null: false
    t.boolean "owner_acceptance", default: false
    t.integer "start_milage", default: 0
    t.integer "end_milage", default: 0
    t.boolean "user_started_condition", default: false
    t.boolean "owner_started_condition", default: false
    t.boolean "user_end_condition", default: false
    t.boolean "owner_end_condition", default: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_rentals_on_car_id"
    t.index ["user_id"], name: "index_rentals_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating", null: false
    t.text "feedback"
    t.integer "writer_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "user_reviews", force: :cascade do |t|
    t.string "comment"
    t.integer "rating"
    t.bigint "user_id", null: false
    t.bigint "rental_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rental_id"], name: "index_user_reviews_on_rental_id"
    t.index ["user_id"], name: "index_user_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
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

  add_foreign_key "cars", "users"
  add_foreign_key "rentals", "cars"
  add_foreign_key "rentals", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "user_reviews", "rentals"
  add_foreign_key "user_reviews", "users"
end
