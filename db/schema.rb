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

ActiveRecord::Schema.define(version: 20141212035732) do

  create_table "admin_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_company_profiles", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "vission"
    t.string   "mission"
    t.string   "motto"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
  end

  create_table "admin_contact_companies", force: true do |t|
    t.integer  "admin_id"
    t.string   "name"
    t.string   "email"
    t.string   "body"
    t.string   "profile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_contacts", force: true do |t|
    t.integer  "admin_id"
    t.string   "name"
    t.string   "email"
    t.text     "body"
    t.string   "profile"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "read_status", default: false
  end

  create_table "admin_galleries", force: true do |t|
    t.string   "title"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.integer  "gallery_group_id"
  end

  create_table "admin_gallery_groups", force: true do |t|
    t.string   "name"
    t.string   "sub_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_help_files", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "help_id"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "admin_helps", force: true do |t|
    t.string   "full_name"
    t.string   "e_mail"
    t.text     "help"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_jornal_team_designers", force: true do |t|
    t.integer  "journal_id"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_journal_issue_asignees", force: true do |t|
    t.integer  "journal_issue_id"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_journal_issue_comment_files", force: true do |t|
    t.integer  "journal_issue_comment_id"
    t.string   "comment_document_file_name"
    t.string   "comment_document_content_type"
    t.integer  "comment_document_file_size"
    t.datetime "comment_document_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_journal_issue_comments", force: true do |t|
    t.integer  "journal_issue_id"
    t.integer  "admin_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_journal_issue_files", force: true do |t|
    t.integer  "journal_issue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "admin_journal_issue_images", force: true do |t|
    t.integer  "journal_issue_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_journal_issues", force: true do |t|
    t.integer  "journal_id"
    t.integer  "status_id"
    t.string   "no",         limit: 10
    t.integer  "type_id"
    t.integer  "priority"
    t.string   "progress"
    t.text     "content"
    t.integer  "asignee"
    t.string   "title"
    t.date     "start"
    t.date     "end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_journal_team_checks", force: true do |t|
    t.integer  "journal_id"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_journal_team_developers", force: true do |t|
    t.integer  "journal_id"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_journals", force: true do |t|
    t.string   "title"
    t.integer  "status_id"
    t.string   "project_manajer"
    t.date     "start"
    t.date     "end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "admin_id"
  end

  create_table "admin_profile_hobbies", force: true do |t|
    t.string   "name"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_profile_skills", force: true do |t|
    t.string   "name"
    t.integer  "skill"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
  end

  create_table "admin_profiles", force: true do |t|
    t.integer  "admin_id"
    t.string   "name"
    t.string   "last_name"
    t.string   "facebook"
    t.string   "e_mail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text     "motto"
    t.text     "describe_me"
    t.string   "skype"
    t.date     "birthday"
  end

  create_table "admin_reply_contact_companies", force: true do |t|
    t.string   "body"
    t.integer  "contact_company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_reply_contacts", force: true do |t|
    t.string   "body"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_status_journals", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_sub_categories", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_type_journals", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admins", force: true do |t|
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
    t.datetime "created_at"
    t.time     "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "category_id"
    t.integer  "sub_category_id"
  end

  create_table "dashboard_comments", force: true do |t|
    t.integer  "article_id"
    t.string   "name"
    t.string   "email"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile"
  end

  create_table "dashboard_reply_comments", force: true do |t|
    t.string   "body"
    t.integer  "comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "temps", force: true do |t|
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
