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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110919073344) do

  create_table "activities", :force => true do |t|
    t.integer  "user_id"
    t.integer  "target_id"
    t.string   "target_type"
    t.integer  "user_group_id"
    t.string   "user_group_type"
    t.integer  "comment_target_id"
    t.string   "comment_target_type"
    t.string   "action"
    t.boolean  "deleted",             :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresses", :force => true do |t|
    t.integer "profile_id"
    t.string  "street"
    t.string  "city"
    t.string  "state"
    t.string  "zip"
    t.string  "country"
    t.integer "account_type", :default => 0
  end

  create_table "circles", :force => true do |t|
    t.integer  "company_id"
    t.integer  "owner_id"
    t.string   "name",                                    :null => false
    t.string   "permalink",                               :null => false
    t.integer  "last_comment_id"
    t.integer  "comments_count",       :default => 0,     :null => false
    t.string   "watchers_ids"
    t.integer  "conversations_count",  :default => 0,     :null => false
    t.integer  "last_conversation_id"
    t.boolean  "public"
    t.boolean  "deleted",              :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "target_id"
    t.string   "target_type"
    t.integer  "user_id"
    t.text     "body"
    t.text     "body_html"
    t.integer  "status"
    t.boolean  "deleted",     :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "name",                                                        :null => false
    t.string   "permalink",                                                   :null => false
    t.string   "domain"
    t.text     "description"
    t.string   "language",          :default => "en"
    t.string   "time_zone",         :default => "Eastern Time (US & Canada)"
    t.text     "settings"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.boolean  "deleted",           :default => false,                        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conversations", :force => true do |t|
    t.integer  "user_group_id"
    t.string   "user_group_type"
    t.integer  "user_id"
    t.string   "title"
    t.integer  "last_comment_id"
    t.integer  "comments_count",  :default => 0,     :null => false
    t.string   "watchers_ids"
    t.boolean  "simple",          :default => false
    t.boolean  "deleted",         :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_addresses", :force => true do |t|
    t.integer "profile_id"
    t.string  "value"
    t.integer "account_type", :default => 0
  end

  create_table "ims", :force => true do |t|
    t.integer "profile_id"
    t.string  "value"
    t.integer "account_im_type", :default => 0
    t.integer "account_type",    :default => 0
  end

  create_table "invitations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "target_id"
    t.string   "target_type"
    t.integer  "role"
    t.string   "email"
    t.integer  "invited_user_id"
    t.string   "token"
    t.boolean  "deleted",         :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.integer  "user_group_id"
    t.string   "user_group_type"
    t.integer  "user_id"
    t.integer  "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", :force => true do |t|
    t.integer  "company_id"
    t.string   "name",                           :null => false
    t.string   "permalink",                      :null => false
    t.text     "description"
    t.string   "domain"
    t.text     "settings"
    t.boolean  "deleted",     :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.integer  "user_id"
    t.integer  "organization_id"
    t.integer  "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phone_numbers", :force => true do |t|
    t.integer "profile_id"
    t.string  "value"
    t.integer "account_type", :default => 0
  end

  create_table "profiles", :force => true do |t|
    t.string   "email"
    t.string   "login"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "common_name"
    t.text     "biography"
    t.string   "time_zone"
    t.string   "locale"
    t.string   "first_day_of_week"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "deleted",             :default => false, :null => false
  end

  create_table "social_networks", :force => true do |t|
    t.integer "profile_id"
    t.string  "value"
    t.integer "account_network_type", :default => 0
    t.integer "account_type",         :default => 0
  end

  create_table "task_lists", :force => true do |t|
    t.integer  "workspace_id"
    t.integer  "user_id"
    t.string   "name",                                    :null => false
    t.integer  "position"
    t.integer  "last_comment_id"
    t.integer  "comments_count",       :default => 0,     :null => false
    t.string   "watchers_ids"
    t.boolean  "archived",             :default => false
    t.integer  "archived_tasks_count", :default => 0,     :null => false
    t.integer  "tasks_count",          :default => 0,     :null => false
    t.datetime "completed_at"
    t.date     "start_on"
    t.date     "finish_on"
    t.boolean  "deleted",              :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", :force => true do |t|
    t.integer  "workspace_id"
    t.integer  "user_id"
    t.integer  "task_list_id"
    t.integer  "parent_id"
    t.string   "name",                               :null => false
    t.integer  "position"
    t.integer  "comments_count",  :default => 0,     :null => false
    t.integer  "last_comment_id"
    t.string   "watchers_ids"
    t.integer  "status"
    t.date     "due_on"
    t.datetime "completed_at"
    t.boolean  "deleted",         :default => false, :null => false
    t.integer  "subtasks_count",  :default => 0,     :null => false
    t.integer  "last_subtask_id"
    t.string   "assignee_ids"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "deleted",                               :default => false, :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "websites", :force => true do |t|
    t.integer "profile_id"
    t.string  "value"
    t.integer "account_type", :default => 0
  end

  create_table "workspaces", :force => true do |t|
    t.integer  "organization_id"
    t.integer  "owner_id"
    t.string   "name",                                    :null => false
    t.string   "permalink",                               :null => false
    t.integer  "last_comment_id"
    t.integer  "comments_count",       :default => 0,     :null => false
    t.integer  "members_count",        :default => 0,     :null => false
    t.string   "watchers_ids"
    t.integer  "tasks_count",          :default => 0,     :null => false
    t.integer  "task_lists_count",     :default => 0,     :null => false
    t.integer  "conversations_count",  :default => 0,     :null => false
    t.integer  "last_conversation_id"
    t.boolean  "track_time",           :default => false
    t.boolean  "archived",             :default => false
    t.boolean  "public"
    t.boolean  "deleted",              :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
