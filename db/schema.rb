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

ActiveRecord::Schema.define(version: 20180518223450) do

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
  end

  add_index "drivers", ["email"], name: "index_drivers_on_email", unique: true
  add_index "drivers", ["reset_password_token"], name: "index_drivers_on_reset_password_token", unique: true

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

  create_table "universities", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
