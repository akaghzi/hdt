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

ActiveRecord::Schema.define(version: 20140905015928) do

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
    t.integer  "user_id"
    t.string   "title"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["ContactReason_id"], name: "index_contacts_on_ContactReason_id", using: :btree
  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id", using: :btree

  create_table "contractors", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contractors", ["user_id"], name: "index_contractors_on_user_id", using: :btree

  create_table "data_src", id: false, force: true do |t|
    t.string "datasrc_id",  limit: 6
    t.string "authors"
    t.string "title"
    t.string "year",        limit: 4
    t.string "journal"
    t.string "vol_city"
    t.string "issue_state", limit: 5
    t.string "start_page",  limit: 5
    t.string "end_page",    limit: 5
  end

  create_table "datsrcln", id: false, force: true do |t|
    t.string "ndb_no",     limit: 5
    t.string "nutr_no",    limit: 3
    t.string "datasrc_id"
  end

  create_table "deriv_cd", id: false, force: true do |t|
    t.string "deriv_cd",   limit: 4
    t.string "deriv_desc"
  end

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

  create_table "fd_desc", id: false, force: true do |t|
    t.string  "ndb_no",      limit: 5
    t.string  "fdgrp_cd",    limit: 4
    t.string  "long_desc"
    t.string  "short_dest"
    t.string  "comname"
    t.string  "manufacname"
    t.string  "survey",      limit: 1
    t.string  "ref_desc"
    t.decimal "refuse"
    t.string  "sciname"
    t.decimal "n_factor"
    t.decimal "pro_factor"
    t.decimal "fat_factor"
    t.decimal "cho_factor"
  end

  add_index "fd_desc", ["ndb_no"], name: "fddescndbno", using: :btree

  create_table "fd_group", id: false, force: true do |t|
    t.string "fdgrp_cd",   limit: 4
    t.string "fdgrp_desc"
  end

  create_table "footnote", id: false, force: true do |t|
    t.string "ndb_no",     limit: 5
    t.string "footnt_no",  limit: 4
    t.string "footnt_typ", limit: 1
    t.string "nutr_no",    limit: 3
    t.string "footnt_txt"
  end

  create_table "item_categories", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "langdesc", id: false, force: true do |t|
    t.string "factor_code", limit: 5
    t.string "description"
  end

  create_table "langual", id: false, force: true do |t|
    t.string "ndb_no",      limit: 5
    t.string "factor_code", limit: 5
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
    t.string   "ndb_no"
    t.decimal  "kcal"
    t.string   "fdgrp_cd"
  end

  add_index "list_items", ["brand_id"], name: "index_list_items_on_brand_id", using: :btree
  add_index "list_items", ["item_category_id"], name: "index_list_items_on_item_category_id", using: :btree
  add_index "list_items", ["list_type_id"], name: "index_list_items_on_list_type_id", using: :btree
  add_index "list_items", ["ndb_no"], name: "index_list_items_on_ndb_no", using: :btree
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

  create_table "nut_data", id: false, force: true do |t|
    t.string  "ndb_no",        limit: 5
    t.string  "nutr_no",       limit: 3
    t.decimal "nutr_val"
    t.decimal "num_data_pts"
    t.decimal "std_error"
    t.string  "src_cd",        limit: 2
    t.string  "deriv_cd",      limit: 4
    t.string  "ref_ndb_no",    limit: 5
    t.string  "add_nutr_mark", limit: 1
    t.decimal "num_studies"
    t.decimal "min"
    t.decimal "max"
    t.decimal "df"
    t.decimal "low_eb"
    t.decimal "up_eb"
    t.string  "stat_cmt"
    t.string  "addmod_date"
    t.string  "cc",            limit: 1
  end

  add_index "nut_data", ["nutr_val"], name: "nutdataval", using: :btree

  create_table "nutr_def", id: false, force: true do |t|
    t.string  "nutr_no",  limit: 3
    t.string  "units",    limit: 7
    t.string  "tagname"
    t.string  "nutrdesc"
    t.string  "num_dec",  limit: 1
    t.decimal "sr_order"
  end

  create_table "products", force: true do |t|
    t.string   "identifier"
    t.text     "detail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rentals", force: true do |t|
    t.integer  "task_id"
    t.integer  "store_id"
    t.string   "name"
    t.string   "description"
    t.decimal  "price",       default: 1.0
    t.boolean  "complete",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rentals", ["store_id"], name: "index_rentals_on_store_id", using: :btree
  add_index "rentals", ["task_id"], name: "index_rentals_on_task_id", using: :btree

  create_table "src_cd", id: false, force: true do |t|
    t.string "src_cd",     limit: 2
    t.string "srccd_desc"
  end

  create_table "stores", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_contractors", force: true do |t|
    t.integer  "task_id"
    t.integer  "contractor_id"
    t.text     "job_detail"
    t.integer  "price"
    t.boolean  "complete",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "task_contractors", ["contractor_id"], name: "index_task_contractors_on_contractor_id", using: :btree
  add_index "task_contractors", ["task_id"], name: "index_task_contractors_on_task_id", using: :btree

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

  create_table "weight", id: false, force: true do |t|
    t.string  "ndb_no",       limit: 5
    t.string  "seq",          limit: 2
    t.decimal "amount"
    t.string  "msre_desc"
    t.decimal "gm_weight"
    t.decimal "num_data_pts"
    t.decimal "std_dev"
  end

end
