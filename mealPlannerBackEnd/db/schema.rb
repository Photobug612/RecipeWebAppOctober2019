# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_22_035129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_favorites_on_recipe_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "menus", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "weekday_id", null: false
    t.bigint "meal_id", null: false
    t.bigint "recipe_id", null: false
    t.bigint "favorite_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["favorite_id"], name: "index_menus_on_favorite_id"
    t.index ["meal_id"], name: "index_menus_on_meal_id"
    t.index ["recipe_id"], name: "index_menus_on_recipe_id"
    t.index ["user_id"], name: "index_menus_on_user_id"
    t.index ["weekday_id"], name: "index_menus_on_weekday_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.string "ingredients"
    t.string "instructions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "weekdays", force: :cascade do |t|
    t.string "day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "favorites", "recipes"
  add_foreign_key "favorites", "users"
  add_foreign_key "menus", "favorites"
  add_foreign_key "menus", "meals"
  add_foreign_key "menus", "recipes"
  add_foreign_key "menus", "users"
  add_foreign_key "menus", "weekdays"
end
