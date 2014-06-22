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

ActiveRecord::Schema.define(version: 20140618055202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_reasons", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.integer  "ContactReason_id"
    t.string   "title"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["ContactReason_id"], name: "index_contacts_on_ContactReason_id", using: :btree

  create_table "favorite_items", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_category_id"
    t.integer  "unit_id"
    t.integer  "store_id"
    t.integer  "brand_id"
    t.string   "name"
    t.string   "identifier"
    t.decimal  "price"
    t.decimal  "quantity"
    t.date     "imported_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorite_items", ["brand_id"], name: "index_favorite_items_on_brand_id", using: :btree
  add_index "favorite_items", ["item_category_id"], name: "index_favorite_items_on_item_category_id", using: :btree
  add_index "favorite_items", ["store_id"], name: "index_favorite_items_on_store_id", using: :btree
  add_index "favorite_items", ["unit_id"], name: "index_favorite_items_on_unit_id", using: :btree
  add_index "favorite_items", ["user_id"], name: "index_favorite_items_on_user_id", using: :btree

  create_table "item_categories", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "list_items", force: true do |t|
    t.integer  "user_id"
    t.integer  "list_type_id"
    t.integer  "item_category_id"
    t.integer  "unit_id"
    t.integer  "store_id"
    t.integer  "brand_id"
    t.integer  "task_id"
    t.string   "name"
    t.string   "identifier"
    t.decimal  "price"
    t.decimal  "quantity"
    t.boolean  "favorite"
    t.boolean  "inbasket",         default: false
    t.boolean  "complete",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "list_items", ["brand_id"], name: "index_list_items_on_brand_id", using: :btree
  add_index "list_items", ["item_category_id"], name: "index_list_items_on_item_category_id", using: :btree
  add_index "list_items", ["list_type_id"], name: "index_list_items_on_list_type_id", using: :btree
  add_index "list_items", ["store_id"], name: "index_list_items_on_store_id", using: :btree
  add_index "list_items", ["task_id"], name: "index_list_items_on_task_id", using: :btree
  add_index "list_items", ["unit_id"], name: "index_list_items_on_unit_id", using: :btree
  add_index "list_items", ["user_id"], name: "index_list_items_on_user_id", using: :btree

  create_table "list_types", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "detail"
    t.date     "target_date"
    t.decimal  "material_cost", default: 0.0
    t.decimal  "rental_cost",   default: 0.0
    t.decimal  "labor_cost",    default: 0.0
    t.boolean  "complete",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "units", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "store_id"
    t.integer  "brand_id"
    t.integer  "unit_id"
    t.integer  "item_category_id"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin"
    t.boolean  "approved"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "users", ["brand_id"], name: "index_users_on_brand_id", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["item_category_id"], name: "index_users_on_item_category_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["store_id"], name: "index_users_on_store_id", using: :btree
  add_index "users", ["unit_id"], name: "index_users_on_unit_id", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
