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

ActiveRecord::Schema.define(:version => 20120131070833) do

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

  create_table "lenses", :force => true do |t|
    t.string   "name",                :limit => 50, :null => false
    t.string   "url_name",            :limit => 50, :null => false
    t.integer  "brand_id",                          :null => false
    t.integer  "minimum_focal_range",               :null => false
    t.integer  "maximum_focal_range",               :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

end
