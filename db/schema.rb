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

ActiveRecord::Schema.define(:version => 20121120065148) do

  create_table "agencies", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "address"
    t.string   "telephone_number"
    t.integer  "fax_number"
    t.boolean  "is_active"
    t.boolean  "deleted",          :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agency_stores", :force => true do |t|
    t.integer  "agency_id"
    t.integer  "department_id"
    t.integer  "resources_id"
    t.integer  "quantity"
    t.text     "serial_no"
    t.integer  "uom"
    t.boolean  "is_active",     :default => true
    t.boolean  "deleted",       :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "appointments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.boolean  "is_active"
    t.boolean  "deleted",    :default => false
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_departments", :force => true do |t|
    t.integer  "category_id"
    t.integer  "department_id"
    t.integer  "created_by"
    t.boolean  "is_active",     :default => true
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
    t.integer  "agency_id"
    t.string   "address"
    t.string   "telephone_number"
    t.integer  "fax_number"
    t.integer  "order_by"
    t.boolean  "is_active"
    t.boolean  "deleted",          :default => false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drivers", :force => true do |t|
    t.integer  "registration_id"
    t.string   "name"
    t.string   "telephone_number"
    t.boolean  "informed",         :default => false
    t.boolean  "already_assigned", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "message_comments", :force => true do |t|
    t.text     "comments"
    t.integer  "message_id"
    t.string   "commenter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.text     "subject"
    t.text     "message"
    t.string   "sender"
    t.string   "message_type"
    t.string   "agency_id"
    t.string   "department_id"
    t.string   "unit_id"
    t.string   "attachment"
    t.boolean  "deleted",                 :default => false
    t.boolean  "send_to_dept_admins",     :default => false
    t.boolean  "send_to_unit_admins",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "sent_to_all_dept_admins", :default => false
  end

  create_table "resource_bookings", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "department_id"
    t.integer  "resource_id"
    t.string   "attachment"
    t.string   "purpose"
    t.string   "description"
    t.integer  "quantity"
    t.datetime "requested_from_date"
    t.datetime "requested_to_date"
    t.datetime "request_processed_date"
    t.datetime "return_date"
    t.string   "status"
    t.boolean  "priority_booking",       :default => false
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resource_ict_bookings", :force => true do |t|
    t.string   "type"
    t.text     "purpose"
    t.string   "location"
    t.datetime "booking_date"
    t.datetime "return_date"
    t.boolean  "need_officer", :default => false
    t.integer  "officer_id"
    t.text     "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resource_managers", :force => true do |t|
    t.integer  "agency_id"
    t.integer  "resource_id"
    t.integer  "quantity"
    t.string   "serial_no"
    t.integer  "uom"
    t.boolean  "is_active"
    t.boolean  "deleted",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resource_transportation_bookings", :force => true do |t|
    t.text     "purpose"
    t.string   "state"
    t.string   "city"
    t.text     "location"
    t.integer  "number_of_passengers"
    t.string   "pick_up_place"
    t.integer  "resource_id"
    t.text     "remarks"
    t.datetime "requested_from_date"
    t.datetime "requested_to_date"
    t.datetime "request_processed_date"
    t.datetime "return_date"
    t.string   "requester_id"
    t.string   "transport_avatar"
    t.string   "status"
    t.string   "approver_id"
    t.boolean  "send_sms_to_driver",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resource_vendors", :force => true do |t|
    t.integer  "resource_id"
    t.integer  "vendor_id"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "sub_category_id"
    t.integer  "department_id"
    t.string   "status"
    t.text     "description"
    t.string   "resource_type"
    t.boolean  "is_returnable"
    t.boolean  "is_facilty_avail", :default => false
    t.integer  "created_by"
    t.boolean  "is_active",        :default => true
    t.boolean  "deleted",          :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role_memberships", :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.integer  "department_id"
    t.integer  "unit_id"
    t.string   "designation"
    t.boolean  "default_dept",  :default => false
    t.string   "status"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.boolean  "is_active"
    t.boolean  "deleted",    :default => false
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

  create_table "sub_categories", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.boolean  "is_active"
    t.boolean  "deleted",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", :force => true do |t|
    t.string   "name"
    t.integer  "department_id"
    t.string   "address"
    t.string   "telephone_number"
    t.integer  "fax_number"
    t.integer  "order_by"
    t.boolean  "is_active"
    t.boolean  "deleted",          :default => false
    t.integer  "created_by"
    t.integer  "updated_by"
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
    t.integer  "service_level_id"
    t.integer  "classification_id"
    t.integer  "grade_id"
    t.integer  "salary_id"
    t.integer  "salary_standard_id"
    t.integer  "appointment_id"
    t.string   "position"
    t.string   "official_position"
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
    t.boolean  "deleted",                                              :default => false
    t.string   "activation_code",                       :limit => 40
    t.datetime "activated_at"
    t.boolean  "widget_one",                                           :default => true
    t.boolean  "widget_two",                                           :default => true
    t.boolean  "profile_status",                                       :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vehicle_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicles", :force => true do |t|
    t.integer  "registration_id"
    t.string   "registration_number"
    t.integer  "vehicle_type_id"
    t.integer  "driver_id"
    t.string   "model"
    t.string   "registration_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendor_stores", :force => true do |t|
    t.integer  "vendor_id"
    t.integer  "resources_id"
    t.integer  "quantity"
    t.text     "serial_no"
    t.integer  "uom"
    t.boolean  "is_active"
    t.boolean  "deleted",      :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendors", :force => true do |t|
    t.string   "name"
    t.string   "remarks"
    t.boolean  "is_active"
    t.text     "address"
    t.string   "contact_no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
