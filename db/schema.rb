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

ActiveRecord::Schema[7.0].define(version: 2022_10_30_074452) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmakers", force: :cascade do |t|
    t.string "name"
    t.boolean "mobile_app"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.date "date"
    t.string "first_team_name"
    t.string "second_team_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pools", force: :cascade do |t|
    t.string "type_of_bet"
    t.integer "pred_first_team_score"
    t.integer "pred_second_team_score"
    t.integer "bet"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id"
    t.bigint "bookmakers_id"
    t.bigint "games_id"
    t.integer "first_team_score"
    t.integer "second_team_score"
    t.index ["bookmakers_id"], name: "index_pools_on_bookmakers_id"
    t.index ["games_id"], name: "index_pools_on_games_id"
    t.index ["users_id"], name: "index_pools_on_users_id"
  end

  create_table "teams", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "country"
    t.integer "founded"
    t.string "leauge"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "pools", "bookmakers", column: "bookmakers_id"
  add_foreign_key "pools", "games", column: "games_id"
  add_foreign_key "pools", "users", column: "users_id"
end
