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

ActiveRecord::Schema.define(:version => 20121019100446) do

  create_table "appointments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classifications", :force => true do |t|
    t.string   "code"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cms_pages", :force => true do |t|
    t.string   "title"
    t.string   "attachement"
    t.text     "content"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.boolean  "is_active"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role_memberships", :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.integer  "department_id"
    t.string   "designation"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_levels", :force => true do |t|
    t.string   "stage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_standards", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.integer  "code"
    t.string   "tel_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", :force => true do |t|
    t.string   "name"
    t.integer  "department_id"
    t.integer  "order_by"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                                :default => "",    :null => false
    t.string   "encrypted_password",                    :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "ic_number"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.integer  "substantive_post_id"
    t.integer  "department_id"
    t.integer  "service_level_id"
    t.integer  "classification_id"
    t.integer  "grade_id"
    t.integer  "salary_id"
    t.integer  "salary_standard_id"
    t.integer  "appointment_id"
    t.string   "position"
    t.string   "official_position"
    t.integer  "unit_id"
    t.string   "gender"
    t.text     "address"
    t.string   "city"
    t.integer  "zipcode"
    t.string   "state"
    t.string   "contact_phone"
    t.string   "contact_mobile"
    t.string   "fax_number"
    t.date     "first_appointment_to_public_service"
    t.date     "first_appointment_to_present_position"
    t.date     "promotion_to_grad_now"
    t.date     "confirmation_date_to_post_now"
    t.date     "date_of_join"
    t.date     "date_of_birth"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "avatar"
    t.datetime "avatar_updated_at"
    t.string   "status"
    t.boolean  "is_admin",                                             :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
