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

ActiveRecord::Schema.define(version: 2019_06_21_215516) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "levels", force: :cascade do |t|
    t.string "name", null: false
    t.integer "weight", null: false
    t.text "description"
    t.index ["name"], name: "index_levels_on_name", unique: true
    t.index ["weight"], name: "index_levels_on_weight", unique: true
  end

  create_table "skill_levels", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "level_id", null: false
    t.index ["level_id"], name: "index_skill_levels_on_level_id"
    t.index ["skill_id", "level_id"], name: "skill_on_level", unique: true
    t.index ["skill_id"], name: "index_skill_levels_on_skill_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name", null: false
    t.integer "category", default: 0, null: false
    t.text "description"
    t.index ["name", "category"], name: "name_on_category", unique: true
  end

  create_table "user_skill_levels", force: :cascade do |t|
    t.bigint "skill_level_id", null: false
    t.bigint "user_id", null: false
    t.index ["skill_level_id"], name: "index_user_skill_levels_on_skill_level_id"
    t.index ["user_id", "skill_level_id"], name: "user_on_skill_level", unique: true
    t.index ["user_id"], name: "index_user_skill_levels_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.boolean "admin", default: false, null: false
    t.string "avatar_url"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "skill_levels", "levels"
  add_foreign_key "skill_levels", "skills"
  add_foreign_key "user_skill_levels", "skill_levels"
  add_foreign_key "user_skill_levels", "users"
end
