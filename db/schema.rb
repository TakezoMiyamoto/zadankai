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

ActiveRecord::Schema.define(version: 20160404052944) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "comments", force: :cascade do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "avatar"
    t.string   "remote_avatar"
  end

  add_index "comments", ["project_id"], name: "index_comments_on_project_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "conferences", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.text     "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "youtube_url"
  end

  add_index "conferences", ["project_id", "created_at"], name: "index_conferences_on_project_id_and_created_at"
  add_index "conferences", ["project_id"], name: "index_conferences_on_project_id"
  add_index "conferences", ["user_id", "created_at"], name: "index_conferences_on_user_id_and_created_at"
  add_index "conferences", ["user_id"], name: "index_conferences_on_user_id"

  create_table "opinions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "conference_id"
    t.string   "opinion_user"
    t.text     "body"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "avatar"
    t.string   "remote_avatar"
  end

  add_index "opinions", ["conference_id", "created_at"], name: "index_opinions_on_conference_id_and_created_at"
  add_index "opinions", ["conference_id"], name: "index_opinions_on_conference_id"
  add_index "opinions", ["user_id", "created_at"], name: "index_opinions_on_user_id_and_created_at"
  add_index "opinions", ["user_id"], name: "index_opinions_on_user_id"

  create_table "projects", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "project_name"
    t.text     "category"
    t.text     "main_image"
    t.text     "movie"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "youtube_url"
    t.string   "description"
    t.string   "brand_name"
    t.boolean  "done"
    t.integer  "aim_money"
    t.datetime "period_date"
  end

  add_index "projects", ["user_id", "created_at"], name: "index_projects_on_user_id_and_created_at"
  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "relationships", force: :cascade do |t|
    t.integer  "joiner_user_id"
    t.integer  "joined_project_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "relationships", ["joined_project_id"], name: "index_relationships_on_joined_project_id"
  add_index "relationships", ["joiner_user_id", "joined_project_id"], name: "index_relationships_on_joiner_user_id_and_joined_project_id", unique: true
  add_index "relationships", ["joiner_user_id"], name: "index_relationships_on_joiner_user_id"

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
    t.string   "nickname"
    t.string   "avatar"
    t.string   "uid"
    t.string   "provider"
    t.string   "remote_avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
