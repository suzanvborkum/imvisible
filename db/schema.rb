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

ActiveRecord::Schema.define(version: 2020_08_24_223505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assault_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "protest_assaults", force: :cascade do |t|
    t.bigint "protest_id", null: false
    t.bigint "assault_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assault_category_id"], name: "index_protest_assaults_on_assault_category_id"
    t.index ["protest_id"], name: "index_protest_assaults_on_protest_id"
  end

  create_table "protests", force: :cascade do |t|
    t.boolean "experienced"
    t.date "date"
    t.time "time"
    t.text "description"
    t.bigint "station_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["station_id"], name: "index_protests_on_station_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "protest_assaults", "assault_categories"
  add_foreign_key "protest_assaults", "protests"
  add_foreign_key "protests", "stations"
end
