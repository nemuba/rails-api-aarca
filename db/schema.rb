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

ActiveRecord::Schema.define(version: 2019_12_02_201005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "races", force: :cascade do |t|
    t.string "local"
    t.text "description"
    t.date "date_race"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.bigint "race_id"
    t.bigint "type_test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_tests_on_race_id"
    t.index ["type_test_id"], name: "index_tests_on_type_test_id"
  end

  create_table "type_tests", force: :cascade do |t|
    t.string "genre"
    t.integer "oar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "tests", "races"
  add_foreign_key "tests", "type_tests"
end
