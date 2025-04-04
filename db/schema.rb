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

ActiveRecord::Schema[7.1].define(version: 2025_03_29_165058) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "player_attributes_type", ["bio_info", "health_status", "hobbies", "character", "additional_info", "knowledge", "inventory"]

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "max_players"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_attributes", force: :cascade do |t|
    t.enum "attr_type", null: false, enum_type: "player_attributes_type"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "bio_info"
    t.boolean "is_show_bio_info"
    t.string "health_status"
    t.boolean "is_show_health_status"
    t.string "hobbies"
    t.boolean "is_show_hobbies"
    t.string "character"
    t.boolean "is_show_character"
    t.string "additional_info"
    t.boolean "is_show_additional_info"
    t.string "knowledge"
    t.boolean "is_show_knowledge"
    t.string "inventory"
    t.boolean "is_show_inventory"
    t.bigint "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_players_on_game_id"
  end

  add_foreign_key "players", "games"
end
