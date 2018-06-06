# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20180605193841) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "fantasy_name"
    t.string   "social_name"
    t.string   "cnpj"
    t.string   "phone"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "number"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "cars", force: :cascade do |t|
    t.integer  "capacity"
    t.string   "plate"
    t.integer  "admin_id"
    t.string   "model"
    t.integer  "year"
    t.string   "mark"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "available",  default: 1
  end

  add_index "cars", ["admin_id"], name: "index_cars_on_admin_id"

  create_table "contracts", force: :cascade do |t|
    t.integer  "due_date"
    t.integer  "number_installments"
    t.integer  "user_id"
    t.integer  "admin_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.float    "value"
  end

  add_index "contracts", ["admin_id"], name: "index_contracts_on_admin_id"
  add_index "contracts", ["user_id"], name: "index_contracts_on_user_id"

  create_table "drivers", force: :cascade do |t|
    t.string   "name"
    t.integer  "admin_id"
    t.string   "email"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "available",  default: 1
  end

  add_index "drivers", ["admin_id"], name: "index_drivers_on_admin_id"

  create_table "fast_travels", force: :cascade do |t|
    t.string   "name"
    t.integer  "number_passenger"
    t.string   "email"
    t.integer  "admin_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.float    "price"
    t.string   "inicial_tour"
    t.string   "final_tour"
    t.string   "phone"
    t.date     "due_date"
  end

  add_index "fast_travels", ["admin_id"], name: "index_fast_travels_on_admin_id"

  create_table "invoices", force: :cascade do |t|
    t.integer  "contract_id"
    t.date     "due_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "status"
    t.float    "value"
  end

  add_index "invoices", ["contract_id"], name: "index_invoices_on_contract_id"

  create_table "notifications", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.date     "notification_date"
    t.integer  "admin_id"
    t.integer  "university_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "notifications", ["admin_id"], name: "index_notifications_on_admin_id"
  add_index "notifications", ["university_id"], name: "index_notifications_on_university_id"

  create_table "passengers", force: :cascade do |t|
    t.integer  "route_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "passengers", ["route_id"], name: "index_passengers_on_route_id"
  add_index "passengers", ["user_id"], name: "index_passengers_on_user_id"

  create_table "routes", force: :cascade do |t|
    t.integer  "driver_id"
    t.integer  "admin_id"
    t.integer  "university_id"
    t.integer  "car_id"
    t.string   "origin"
    t.string   "period_day"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "routes", ["admin_id"], name: "index_routes_on_admin_id"
  add_index "routes", ["car_id"], name: "index_routes_on_car_id"
  add_index "routes", ["driver_id"], name: "index_routes_on_driver_id"
  add_index "routes", ["university_id"], name: "index_routes_on_university_id"

  create_table "settings", force: :cascade do |t|
    t.string   "token"
    t.integer  "days_for_payment"
    t.integer  "admin_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "settings", ["admin_id"], name: "index_settings_on_admin_id"

  create_table "universities", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "admin_id"
  end

  add_index "universities", ["admin_id"], name: "index_universities_on_admin_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "city"
    t.string   "street"
    t.string   "number"
    t.string   "state"
    t.string   "phone"
    t.integer  "admin_id"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "university_id"
    t.integer  "allocated",              default: 0
  end

  add_index "users", ["admin_id"], name: "index_users_on_admin_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["university_id"], name: "index_users_on_university_id"

  create_table "weeks", force: :cascade do |t|
    t.string   "mond"
    t.string   "tues"
    t.string   "wedn"
    t.string   "thur"
    t.string   "frid"
    t.string   "satu"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "weeks", ["user_id"], name: "index_weeks_on_user_id"

end
