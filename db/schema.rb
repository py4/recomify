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

ActiveRecord::Schema.define(version: 20150331000658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "customer_id"
    t.string   "email"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "shop_id"
  end

  add_index "customers", ["customer_id"], name: "index_customers_on_customer_id", using: :btree
  add_index "customers", ["email"], name: "index_customers_on_email", using: :btree
  add_index "customers", ["shop_id"], name: "index_customers_on_shop_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "product_id"
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.string   "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "shop_id"
  end

  add_index "products", ["product_id"], name: "index_products_on_product_id", unique: true, using: :btree
  add_index "products", ["shop_id"], name: "index_products_on_shop_id", using: :btree

  create_table "recommendations", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "email"
    t.text     "comment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "product_id"
  end

  add_index "recommendations", ["customer_id"], name: "index_recommendations_on_customer_id", using: :btree
  add_index "recommendations", ["product_id"], name: "index_recommendations_on_product_id", using: :btree

  create_table "shops", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.hstore   "settings"
    t.string   "domain"
    t.string   "money_format"
  end

  add_foreign_key "customers", "shops"
  add_foreign_key "products", "shops"
  add_foreign_key "recommendations", "customers"
  add_foreign_key "recommendations", "products"
end
