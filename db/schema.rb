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

ActiveRecord::Schema.define(:version => 20130121173259) do

  create_table "bbs_admins", :force => true do |t|
    t.integer "uid"
    t.string  "modaction"
    t.date    "dateline"
    t.integer "count"
    t.integer "posts"
    t.string  "username"
  end

  create_table "bbs_core_customers", :force => true do |t|
    t.integer "uid"
    t.integer "friend"
    t.integer "doing"
    t.integer "blog"
    t.integer "post"
    t.integer "thread"
    t.integer "share"
    t.integer "online"
    t.integer "post_back"
    t.integer "yd_time"
    t.date    "current_date"
    t.string  "username"
    t.integer "bbs_type"
  end

  create_table "campaigns", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "clicks", :force => true do |t|
    t.string  "tagname"
    t.integer "clicks"
    t.date    "record_date"
    t.integer "campaign"
    t.integer "page"
    t.integer "up_category"
    t.string  "tag_type"
    t.integer "position"
    t.integer "category"
  end

  create_table "daily_tasks", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.datetime "plan_start_timeline"
    t.datetime "plan_finish_timeline"
    t.integer  "accomplishment"
    t.integer  "status"
    t.string   "url"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "google_analytics", :force => true do |t|
    t.date    "current_date"
    t.integer "unique_visitor"
    t.integer "visit_product"
    t.integer "product_page"
    t.integer "average_page"
    t.string  "conversion1"
    t.string  "stay_time"
    t.string  "bounce_rate"
    t.integer "click"
    t.string  "conversion2"
    t.integer "sat"
    t.integer "gre"
    t.integer "toefl"
    t.integer "ielts"
    t.integer "liuxue"
    t.integer "page_view"
  end

  create_table "google_traffic_rankings", :force => true do |t|
    t.date    "current_date"
    t.string  "source_name"
    t.integer "visits"
    t.integer "channel_type"
  end

  create_table "organic_traffics", :force => true do |t|
    t.string  "keyword"
    t.integer "goal1"
    t.string  "conversion1_rate"
    t.integer "goal3"
    t.string  "conversion3_rate"
    t.date    "current_date"
    t.integer "clicks"
  end

  create_table "paid_traffics", :force => true do |t|
    t.date    "current_date"
    t.string  "keyword"
    t.integer "clicks"
    t.integer "goal1"
    t.integer "goal3"
    t.string  "conversion1_rate"
    t.string  "conversion3_rate"
  end

  create_table "permissions", :force => true do |t|
    t.string   "name"
    t.string   "desc"
    t.string   "action"
    t.string   "subject_class"
    t.string   "subject_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "positions", :force => true do |t|
    t.string   "name"
    t.integer  "upid"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "referral_traffics", :force => true do |t|
    t.string  "source_name"
    t.integer "clicks"
    t.integer "goal1"
    t.string  "conversion1_rate"
    t.integer "goal3"
    t.string  "conversion3_rate"
    t.date    "current_date"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_permissions", :force => true do |t|
    t.integer "role_id"
    t.integer "permission_id"
  end

  create_table "tag_categories", :force => true do |t|
    t.string   "name"
    t.integer  "uid"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",               :default => "", :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

  create_table "users_roles", :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "web_pages", :force => true do |t|
    t.string   "domain"
    t.integer  "categroy"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "content"
  end

end
