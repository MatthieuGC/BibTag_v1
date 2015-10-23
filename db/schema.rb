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

ActiveRecord::Schema.define(version: 20150702084227) do

  create_table "abouts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_forms", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "message"
    t.string   "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",         default: 0, null: false
    t.integer  "attempts",         default: 0, null: false
    t.text     "handler",                      null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "progress_stage"
    t.integer  "progress_current", default: 0
    t.integer  "progress_max",     default: 0
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "facet_leafs", force: :cascade do |t|
    t.integer  "facet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facets", force: :cascade do |t|
    t.string   "facet_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "headings", force: :cascade do |t|
    t.string   "heading_name"
    t.integer  "facet_leaf_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "abbreviation"
  end

  create_table "headings_surrogates", id: false, force: :cascade do |t|
    t.integer "heading_id"
    t.integer "surrogate_id"
  end

  add_index "headings_surrogates", ["heading_id"], name: "index_headings_surrogates_on_heading_id"
  add_index "headings_surrogates", ["surrogate_id"], name: "index_headings_surrogates_on_surrogate_id"

  create_table "imports", force: :cascade do |t|
    t.string   "attachment"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "collection_id"
    t.string   "new_collection"
  end

  create_table "keywords", force: :cascade do |t|
    t.string   "keywordName"
    t.integer  "surrogate_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "keywords", ["surrogate_id"], name: "index_keywords_on_surrogate_id"

  create_table "resource_collections", force: :cascade do |t|
    t.string   "collection_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
  end

  create_table "resource_collections_srg", id: false, force: :cascade do |t|
    t.integer "resource_collection_id"
    t.integer "surrogate_id"
  end

  add_index "resource_collections_srg", ["resource_collection_id"], name: "index_resource_collections_srg_on_resource_collection_id"
  add_index "resource_collections_srg", ["surrogate_id"], name: "index_resource_collections_srg_on_surrogate_id"

  create_table "resource_collections_surrogates", id: false, force: :cascade do |t|
    t.integer "resource_collection_id"
    t.integer "surrogate_id"
  end

  add_index "resource_collections_surrogates", ["resource_collection_id"], name: "res_col_srg_index"
  add_index "resource_collections_surrogates", ["surrogate_id"], name: "index_resource_collections_surrogates_on_surrogate_id"

  create_table "resource_collections_users", id: false, force: :cascade do |t|
    t.integer "resource_collection_id"
    t.integer "user_id"
  end

  add_index "resource_collections_users", ["resource_collection_id"], name: "index_resource_collections_users_on_resource_collection_id"
  add_index "resource_collections_users", ["user_id"], name: "index_resource_collections_users_on_user_id"

  create_table "se_values", force: :cascade do |t|
    t.string   "value"
    t.integer  "surrogate_element_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "surrogate_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surrogate_elements", force: :cascade do |t|
    t.string   "field_name"
    t.integer  "surrogate_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "surrogate_elements", ["surrogate_id"], name: "index_surrogate_elements_on_surrogate_id"

  create_table "surrogates", force: :cascade do |t|
    t.string   "entry_type"
    t.string   "entry_key"
    t.string   "doi"
    t.string   "url"
    t.integer  "resource_collection_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "surrogates", ["resource_collection_id"], name: "index_surrogates_on_resource_collection_id"

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "nom"
    t.string   "email"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "encrypted_password"
    t.string   "salt"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
