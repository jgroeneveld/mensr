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

ActiveRecord::Schema.define(:version => 20110310205218) do

  create_table "category_parse_datas", :force => true do |t|
    t.integer  "row"
    t.integer  "col",               :default => 1
    t.integer  "menue_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "defaults", :force => true do |t|
    t.string   "category_sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dish_photos", :force => true do |t|
    t.integer  "dish_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dish_sets", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "common_key_words", :default => ""
    t.integer  "average_rating",   :default => 0
    t.integer  "ratings_count",    :default => 0
    t.integer  "mensa_id"
  end

  create_table "dish_tags", :force => true do |t|
    t.integer  "dish_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind"
  end

  create_table "dishes", :force => true do |t|
    t.float    "price_a"
    t.float    "price_b"
    t.string   "description"
    t.date     "serve_date"
    t.integer  "mensa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "average_rating",    :default => 0
    t.integer  "dish_set_id"
    t.integer  "menue_category_id"
  end

  create_table "layout_options", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "show_tags",           :default => true
    t.boolean  "show_price_a",        :default => true
    t.boolean  "show_price_b",        :default => true
    t.boolean  "show_rating",         :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "like_words",          :default => ""
    t.string   "dislike_words",       :default => ""
    t.string   "category_sort_order"
  end

  create_table "mensas", :force => true do |t|
    t.string   "name"
    t.string   "hours"
    t.string   "location"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menue_categories", :force => true do |t|
    t.string   "name"
    t.integer  "mensa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "dish_id"
    t.integer  "value"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_hash"
    t.string   "password_salt"
    t.boolean  "is_admin",      :default => false
  end

end
