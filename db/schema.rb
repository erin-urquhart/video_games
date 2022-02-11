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

ActiveRecord::Schema[7.0].define(version: 2022_02_11_043220) do
  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name"
    t.integer "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "video_game_genres", force: :cascade do |t|
    t.string "name"
    t.integer "videogame_id", null: false
    t.integer "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_video_game_genres_on_genre_id"
    t.index ["videogame_id"], name: "index_video_game_genres_on_videogame_id"
  end

  create_table "video_games", force: :cascade do |t|
    t.string "name"
    t.integer "release_year"
    t.integer "employee_id", null: false
    t.integer "platform_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_video_games_on_employee_id"
    t.index ["platform_id"], name: "index_video_games_on_platform_id"
  end

  add_foreign_key "video_game_genres", "genres"
  add_foreign_key "video_game_genres", "videogames"
  add_foreign_key "video_games", "employees"
  add_foreign_key "video_games", "platforms"
end
