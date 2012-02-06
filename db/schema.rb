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

ActiveRecord::Schema.define(:version => 20120205212101) do

  create_table "brands", :force => true do |t|
    t.string   "name",       :limit => 50, :null => false
    t.string   "url_name",   :limit => 50, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "brands", ["url_name"], :name => "index_brands_on_url_name", :unique => true

  create_table "cameras", :force => true do |t|
    t.string   "name",       :limit => 50, :null => false
    t.string   "url_name",   :limit => 50, :null => false
    t.integer  "brand_id",                 :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "cameras", ["brand_id"], :name => "index_cameras_on_brand_id"
  add_index "cameras", ["url_name"], :name => "index_cameras_on_url_name", :unique => true

  create_table "exif_names", :force => true do |t|
    t.integer "exifable_id",                  :null => false
    t.string  "exifable_type",                :null => false
    t.string  "name",          :limit => 128, :null => false
  end

  add_index "exif_names", ["exifable_type", "name"], :name => "index_exif_names_on_exifable_type_and_name", :unique => true

  create_table "lenses", :force => true do |t|
    t.string   "name",                :limit => 50, :null => false
    t.string   "url_name",            :limit => 50, :null => false
    t.integer  "brand_id",                          :null => false
    t.integer  "minimum_focal_range",               :null => false
    t.integer  "maximum_focal_range",               :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "photo_metadata", :force => true do |t|
    t.integer  "brand_id"
    t.integer  "camera_id"
    t.integer  "lens_id"
    t.date     "taken_at"
    t.float    "exposure_time"
    t.string   "f_number"
    t.string   "iso"
    t.float    "focal_length"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "orientation"
    t.integer  "width",                             :null => false
    t.integer  "height",                            :null => false
    t.text     "exif"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "rating_sum",         :default => 0
    t.integer  "rating_count",       :default => 0
  end

  create_table "ratings", :force => true do |t|
    t.integer  "photo_metadata_id", :null => false
    t.integer  "value",             :null => false
    t.datetime "created_at"
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
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "authentication_token"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
