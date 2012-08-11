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

ActiveRecord::Schema.define(:version => 20120726150540) do

  create_table "access_controls", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
  end

  create_table "admin_links", :force => true do |t|
    t.string   "url"
    t.string   "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "admin_logos", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "admin_menu_entries", :force => true do |t|
    t.string   "title"
    t.integer  "order"
    t.integer  "admin_page_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "admin_pages", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.boolean  "publish"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "admin_pages", ["slug"], :name => "index_admin_pages_on_slug", :unique => true

  create_table "advanced_searches", :force => true do |t|
    t.string   "make"
    t.string   "model"
    t.string   "year_from"
    t.string   "year_to"
    t.string   "lot_number"
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "state_id"
    t.boolean  "buy_it_now"
    t.boolean  "fixed"
    t.boolean  "make_an_offer_eligible"
    t.string   "slug"
    t.string   "transmission"
    t.string   "mileage"
    t.string   "body_color"
    t.string   "body_style"
    t.string   "drive_train"
    t.string   "vehicle_condition"
    t.boolean  "closes_today"
    t.boolean  "closes_tomorrow"
  end

  add_index "advanced_searches", ["user_id"], :name => "index_advanced_searches_on_user_id"

  create_table "advanced_searches_sale_title_types", :id => false, :force => true do |t|
    t.integer "advanced_search_id"
    t.integer "sale_title_type_id"
  end

  create_table "auctions", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.float    "price"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.datetime "end_date"
    t.integer  "year"
    t.text     "description"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "kind"
    t.boolean  "enabled",                :default => true
    t.string   "picture_url"
    t.string   "lot_number"
    t.string   "slug"
    t.string   "mark"
    t.string   "model"
    t.string   "make_an_offer_eligible"
    t.string   "buy_it_now_price"
    t.string   "color"
    t.string   "body_style"
    t.string   "damage_description"
    t.string   "secundary_damage"
    t.string   "title_state"
    t.string   "vin"
    t.string   "transmission"
    t.string   "drive_train"
    t.string   "vehicle_condition"
    t.string   "yard_number"
    t.string   "yard_name"
    t.string   "day_of_week"
    t.string   "model_group"
    t.string   "model_detail"
    t.string   "sale_title_type"
    t.string   "has_keys"
    t.string   "odometer_brand"
    t.string   "lot_acv"
    t.string   "engine"
    t.string   "fuel_type"
    t.string   "cylinders"
    t.string   "run_drives"
    t.string   "sale_status"
    t.text     "special_note"
    t.string   "country"
    t.string   "currency_code"
    t.float    "mileage"
    t.float    "high_bid"
  end

  add_index "auctions", ["slug"], :name => "index_auctions_on_slug", :unique => true
  add_index "auctions", ["user_id"], :name => "index_auctions_on_user_id"

  create_table "authentications", :force => true do |t|
    t.string   "provider"
    t.string   "uuid"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "authentications", ["user_id"], :name => "index_authentications_on_user_id"

  create_table "banners", :force => true do |t|
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "link"
    t.string   "position"
  end

  create_table "bids", :force => true do |t|
    t.integer  "user_id"
    t.integer  "auction_id"
    t.float    "value"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "winner",     :default => false
    t.boolean  "active",     :default => true
  end

  add_index "bids", ["auction_id"], :name => "index_bids_on_auction_id"
  add_index "bids", ["user_id"], :name => "index_bids_on_user_id"

  create_table "csvfiles", :force => true do |t|
    t.string   "csv_file_name"
    t.string   "csv_content_type"
    t.integer  "csv_file_size"
    t.datetime "csv_updated_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "messages", :force => true do |t|
    t.string   "to"
    t.string   "from"
    t.string   "subject"
    t.text     "body"
    t.integer  "messageable_id"
    t.string   "messageable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "payment_transactions", :force => true do |t|
    t.integer  "payment_id"
    t.float    "price"
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "payment_transactions", ["payment_id"], :name => "index_payment_transactions_on_payment_id"

  create_table "payments", :force => true do |t|
    t.integer  "user_id"
    t.float    "price"
    t.string   "transaction_number"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "card_number"
    t.integer  "card_verification"
    t.date     "card_expires_on"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "status"
  end

  add_index "payments", ["status"], :name => "index_payments_on_status"
  add_index "payments", ["user_id"], :name => "index_payments_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "sale_title_types", :force => true do |t|
    t.integer  "state_id"
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "sale_title_types", ["state_id"], :name => "index_sale_title_types_on_state_id"

  create_table "slider_items", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.string   "image"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "acronym"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "transactions", :force => true do |t|
    t.string   "title"
    t.float    "value",                :default => 0.0
    t.string   "transaction_type"
    t.string   "transactionable_type"
    t.integer  "transactionable_id"
    t.string   "transaction_status",   :default => "P"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :null => false
    t.string   "encrypted_password",                    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "nickname"
    t.string   "name"
    t.text     "description"
    t.boolean  "admin"
    t.string   "phone_number"
    t.string   "address"
    t.string   "city"
    t.string   "zip"
    t.integer  "state_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["nickname"], :name => "index_users_on_nickname"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "watch_lists", :force => true do |t|
    t.integer  "user_id"
    t.integer  "auction_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "watch_lists", ["auction_id"], :name => "index_watch_lists_on_auction_id"
  add_index "watch_lists", ["user_id"], :name => "index_watch_lists_on_user_id"

end
