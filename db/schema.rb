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

ActiveRecord::Schema.define(version: 2021_03_02_182510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "historic_sensors", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "serial_number"
    t.string "owner"
    t.string "manufacturer"
    t.string "model"
    t.string "manual"
    t.string "datasheet"
    t.date "acquisition_date"
    t.date "maintenance_date"
    t.date "calibration_date"
    t.text "observation"
    t.integer "register_number"
    t.bigint "sensor_id"
    t.bigint "item_type_id"
    t.bigint "place_id"
    t.bigint "situation_id"
    t.bigint "user_id"
    t.index ["item_type_id"], name: "index_historic_sensors_on_item_type_id"
    t.index ["place_id"], name: "index_historic_sensors_on_place_id"
    t.index ["sensor_id"], name: "index_historic_sensors_on_sensor_id"
    t.index ["situation_id"], name: "index_historic_sensors_on_situation_id"
    t.index ["user_id"], name: "index_historic_sensors_on_user_id"
  end

  create_table "item_types", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.string "item_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_item_types_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "item"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "places", force: :cascade do |t|
    t.string "place"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sensors", force: :cascade do |t|
    t.bigint "item_type_id", null: false
    t.string "serial_number"
    t.string "owner"
    t.integer "register_number"
    t.string "model"
    t.string "manufacturer"
    t.bigint "place_id", null: false
    t.bigint "situation_id", null: false
    t.string "manual"
    t.string "datasheet"
    t.date "acquisition_date"
    t.date "maintenance_date"
    t.date "calibration_date"
    t.text "observation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_type_id"], name: "index_sensors_on_item_type_id"
    t.index ["place_id"], name: "index_sensors_on_place_id"
    t.index ["situation_id"], name: "index_sensors_on_situation_id"
  end

  create_table "situations", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "item_types", "items"
  add_foreign_key "sensors", "item_types"
  add_foreign_key "sensors", "places"
  add_foreign_key "sensors", "situations"
end
