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

ActiveRecord::Schema.define(version: 2018_09_12_113724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ideas", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "protagonist"
    t.string "antagonist"
    t.string "begins"
    t.string "ends"
    t.integer "act"
    t.string "turn"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_ideas_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "protagonist"
  end

  create_table "structures", force: :cascade do |t|
    t.bigint "project_id"
    t.boolean "saved"
    t.string "title"
    t.text "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "order_of_ideas", default: [], array: true
    t.index ["project_id"], name: "index_structures_on_project_id"
  end

  add_foreign_key "ideas", "projects"
  add_foreign_key "structures", "projects"
end