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

ActiveRecord::Schema.define(:version => 20120203063621) do

  create_table "attendees", :force => true do |t|
    t.string   "username"
    t.string   "realname"
    t.string   "email"
    t.text     "emergency_info"
    t.decimal  "price"
    t.decimal  "amount"
    t.decimal  "fee"
    t.boolean  "paid"
    t.string   "txn"
    t.integer  "event_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "datenight"
  end

  add_index "attendees", ["event_id"], :name => "index_attendees_on_event_id"

  create_table "damedaters", :force => true do |t|
    t.integer  "attendee_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "damedaters", ["attendee_id"], :name => "index_damedaters_on_attendee_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.date     "date"
    t.string   "location"
    t.string   "zipcode"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "mandaters", :force => true do |t|
    t.integer  "attendee_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "mandaters", ["attendee_id"], :name => "index_mandaters_on_attendee_id"

  create_table "members", :force => true do |t|
    t.string   "username"
    t.string   "realname"
    t.string   "email"
    t.text     "emergency_info"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
