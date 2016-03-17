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

ActiveRecord::Schema.define(version: 20160317162407) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "balances", force: :cascade do |t|
    t.date     "date"
    t.string   "name",              limit: 255
    t.integer  "admin_user_id",     limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
    t.string   "status",            limit: 255
  end

  add_index "balances", ["admin_user_id"], name: "index_balances_on_admin_user_id", using: :btree

  create_table "banners", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "link",               limit: 255
    t.integer  "admin_user_id",      limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.text     "description",        limit: 65535
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.string   "status",             limit: 255
  end

  add_index "banners", ["admin_user_id"], name: "index_banners_on_admin_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.string   "subtitle",      limit: 255
    t.date     "date"
    t.text     "info",          limit: 65535
    t.string   "status",        limit: 255
    t.integer  "admin_user_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "slug",          limit: 255
  end

  add_index "events", ["admin_user_id"], name: "index_events_on_admin_user_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
    t.integer  "news_id",           limit: 4
    t.integer  "event_id",          limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.boolean  "cover",             limit: 1,   default: false
  end

  add_index "images", ["event_id"], name: "index_images_on_event_id", using: :btree
  add_index "images", ["news_id"], name: "index_images_on_news_id", using: :btree

  create_table "news", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.string   "subtitle",      limit: 255
    t.date     "date"
    t.text     "info",          limit: 65535
    t.string   "status",        limit: 255
    t.string   "video",         limit: 255
    t.integer  "admin_user_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "category_id",   limit: 4
    t.string   "slug",          limit: 255
    t.string   "featured",      limit: 255
  end

  add_index "news", ["admin_user_id"], name: "index_news_on_admin_user_id", using: :btree
  add_index "news", ["category_id"], name: "index_news_on_category_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "slug",        limit: 255
  end

  add_foreign_key "balances", "admin_users"
  add_foreign_key "banners", "admin_users"
  add_foreign_key "events", "admin_users"
  add_foreign_key "images", "events"
  add_foreign_key "images", "news"
  add_foreign_key "news", "admin_users"
  add_foreign_key "news", "categories"
end
