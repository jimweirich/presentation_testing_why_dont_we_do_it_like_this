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

ActiveRecord::Schema.define(:version => 20100929174334) do

  create_table "contracts", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "sales_rep_id"
    t.integer  "service_type_id"
    t.float    "price_per_visit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "missed_service_reasons", :force => true do |t|
    t.string   "description"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "missed_service_reasons", ["code"], :name => "index_missed_service_reasons_on_code", :unique => true

  create_table "sales_reps", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "employee_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedule_templates", :force => true do |t|
    t.string   "description"
    t.string   "algorithm"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedules", :force => true do |t|
    t.date     "starts_on"
    t.date     "ends_on"
    t.integer  "contract_id"
    t.integer  "service_template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_techs", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "employee_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_trips", :force => true do |t|
    t.integer  "contract_id",                               :null => false
    t.integer  "service_tech_id",                           :null => false
    t.integer  "missed_service_reason_id"
    t.float    "discount",                 :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_types", :force => true do |t|
    t.string   "description"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "service_types", ["code"], :name => "index_service_types_on_code", :unique => true

end
