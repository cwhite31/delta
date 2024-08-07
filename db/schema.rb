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

ActiveRecord::Schema[7.2].define(version: 2024_08_24_132843) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "tablefunc"

  create_table "bands", force: :cascade do |t|
    t.string "key"
    t.string "name"
    t.string "range"
    t.decimal "frequency_start_mhz", precision: 8, scale: 4
    t.decimal "frequency_end_mhz", precision: 8, scale: 4
    t.boolean "is_active", default: true
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "configs", force: :cascade do |t|
    t.string "lotw_download_url"
    t.string "lotw_upload_url"
    t.string "lotw_rcvd_mark"
    t.string "lotw_login_url"
    t.string "eqsl_download_url"
    t.string "eqsl_rcvd_mark"
    t.string "clublog_download_url"
    t.string "clublog_upload_url"
    t.string "clublog_rcvd_mark"
    t.string "clublog_login_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "callsign"
    t.string "name"
    t.string "prefix"
    t.string "country"
    t.string "state"
    t.string "county"
    t.integer "dxcc_id"
    t.string "gridsquare"
    t.string "iota_code"
    t.integer "cq_zone"
    t.integer "itu_zone"
    t.integer "iaru_zone"
    t.string "continent"
    t.date "qso_date"
    t.string "time_on"
    t.string "time_off"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string "band"
    t.decimal "frequency", precision: 10, scale: 6
    t.decimal "frequency_split_transmit"
    t.string "mode"
    t.string "submode"
    t.string "propagation_mode"
    t.integer "signal_report_received"
    t.integer "signal_report_sent"
    t.integer "contest_id"
    t.string "contest_reference_sent"
    t.string "contest_reference_received"
    t.string "satellite_name"
    t.string "operator_name"
    t.string "qth"
    t.string "power"
    t.string "antenna"
    t.string "category"
    t.string "check"
    t.string "licence_class"
    t.string "comments"
    t.string "computer"
    t.string "station_gridsquare"
    t.string "qsl_confirmed_by"
    t.boolean "qsl_received", default: false
    t.boolean "qsl_sent", default: false
    t.boolean "lotw_qsl_sent", default: false
    t.boolean "lotw_qsl_received", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["callsign"], name: "index_contacts_on_callsign"
    t.index ["qso_date"], name: "index_contacts_on_qso_date"
  end

  create_table "countries", force: :cascade do |t|
    t.string "prefix"
    t.string "name"
    t.integer "dxcc_id"
    t.string "continent_code"
    t.integer "cq_zone"
    t.integer "itu_zone"
    t.decimal "lat", precision: 6, scale: 2
    t.decimal "long", precision: 6, scale: 2
    t.decimal "utc_offset", precision: 6, scale: 2
    t.boolean "worked", default: false
    t.boolean "confirmed", default: false
    t.boolean "2200m", default: false
    t.boolean "630m", default: false
    t.boolean "160m", default: false
    t.boolean "80m", default: false
    t.boolean "60m", default: false
    t.boolean "40m", default: false
    t.boolean "30m", default: false
    t.boolean "20m", default: false
    t.boolean "17m", default: false
    t.boolean "15m", default: false
    t.boolean "12m", default: false
    t.boolean "10m", default: false
    t.boolean "8m", default: false
    t.boolean "6m", default: false
    t.boolean "4m", default: false
    t.boolean "2m", default: false
    t.boolean "70cm", default: false
    t.text "alias"
    t.index ["dxcc_id"], name: "index_countries_on_dxcc_id"
    t.index ["name"], name: "index_countries_on_name"
    t.index ["prefix"], name: "index_countries_on_prefix"
  end

  create_table "notes", force: :cascade do |t|
    t.string "category"
    t.string "title", null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "station_profiles", force: :cascade do |t|
    t.string "station_callsign", null: false
    t.string "station_profile_name", null: false
    t.string "station_gridsquare"
    t.string "station_city", null: false
    t.string "station_iota"
    t.string "station_sota"
    t.string "station_dxcc"
    t.string "station_country"
    t.string "station_cnty"
    t.integer "station_cq"
    t.integer "station_itu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "display_name", null: false
    t.boolean "is_developer"
    t.boolean "is_administrator"
    t.integer "created_by_user_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "welcomes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
