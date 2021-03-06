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

ActiveRecord::Schema.define(:version => 20130518155422) do

  create_table "appointment_histories", :force => true do |t|
    t.integer  "appointment_id"
    t.integer  "customer_id"
    t.integer  "employee_id"
    t.datetime "appointment_time"
    t.integer  "state"
    t.string   "note"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "created_by"
  end

  create_table "appointment_services", :force => true do |t|
    t.integer  "appointment_id"
    t.integer  "service_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "stylist_service_id"
  end

  create_table "appointments", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "employee_id"
    t.datetime "appointment_time"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "state"
    t.string   "note"
  end

  create_table "employees", :force => true do |t|
    t.integer  "user_id"
    t.integer  "salon_id"
    t.boolean  "salon_admin"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "salons", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "email"
    t.string   "url"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "sunday_hours"
    t.string   "monday_hours"
    t.string   "tuesday_hours"
    t.string   "wednesday_hours"
    t.string   "thursday_hours"
    t.string   "friday_hours"
    t.string   "saturday_hours"
    t.string   "image"
    t.text     "bio"
    t.string   "parameterized_name"
  end

  add_index "salons", ["city", "state"], :name => "index_salons_on_city_and_state"
  add_index "salons", ["name"], :name => "index_salons_on_name"

  create_table "services", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.float    "price"
    t.integer  "duration"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "salon_id"
  end

  create_table "stylist_services", :force => true do |t|
    t.integer  "service_id"
    t.string   "employee_id"
    t.float    "price"
    t.integer  "duration"
    t.boolean  "modified"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",                   :default => false
    t.boolean  "confirmed",               :default => false
    t.string   "confirmation_code"
    t.string   "type"
    t.boolean  "password_reset_required", :default => false
    t.string   "phone"
    t.string   "alternate_phone"
    t.string   "reset_code"
    t.string   "image"
    t.integer  "wireless_provider_id"
    t.text     "bio"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "wireless_providers", :force => true do |t|
    t.string   "description"
    t.string   "domain"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
