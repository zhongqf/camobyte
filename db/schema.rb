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

ActiveRecord::Schema.define(:version => 20110828140335) do

  create_table "addresses", :force => true do |t|
    t.integer "profile_id"
    t.string  "street"
    t.string  "city"
    t.string  "state"
    t.string  "zip"
    t.string  "country"
    t.integer "account_type", :default => 0
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
  end

  create_table "social_networks", :force => true do |t|
    t.integer "profile_id"
    t.string  "value"
    t.integer "account_network_type", :default => 0
    t.integer "account_type",         :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "websites", :force => true do |t|
    t.integer "profile_id"
    t.string  "value"
    t.integer "account_type", :default => 0
  end

end
