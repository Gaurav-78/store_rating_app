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

ActiveRecord::Schema[7.2].define(version: 2025_02_15_143438) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ratings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "store_id", null: false
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "score"
    t.index ["store_id"], name: "index_ratings_on_store_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["owner_id"], name: "index_stores_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 60, null: false
    t.string "email"
    t.string "address", limit: 400
    t.string "password_digest", null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "ratings", "stores"
  add_foreign_key "ratings", "users"
  add_foreign_key "stores", "users", column: "owner_id"
end
