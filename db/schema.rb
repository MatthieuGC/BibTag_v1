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

ActiveRecord::Schema.define(version: 20150519092030) do

  create_table "imports", force: :cascade do |t|
    t.string   "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.string   "keywordName"
    t.integer  "surrogate_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "keywords", ["surrogate_id"], name: "index_keywords_on_surrogate_id"

  create_table "se_values", force: :cascade do |t|
    t.string   "value"
    t.integer  "surrogate_element_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "surrogate_elements", force: :cascade do |t|
    t.string   "field_name"
    t.string   "surrogate_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "surrogate_elements", ["surrogate_id"], name: "index_surrogate_elements_on_surrogate_id"

  create_table "surrogates", force: :cascade do |t|
    t.string   "entry_type"
    t.string   "entry_key"
    t.string   "doi"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "nom"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
