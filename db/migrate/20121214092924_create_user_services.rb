class CreateUserServices < ActiveRecord::Migration
  def self.up
    create_table :user_services do |t|
      t.references :user
      t.text :office_address
      t.string :postal_code
      t.string :city
      t.string :state
      t.string :office_number
      t.string :office_fax
      t.string :email
      t.string :recent_salary
      t.string :salary_scale1
      t.string :salary_scale2
      t.integer :service_level_id
      t.integer :classification_id
      t.integer :grade_id      
      t.integer :salary_standard_id
      t.integer :appointment_id
      t.string :position
      t.string :official_position
      t.date :first_appointment_to_public_service
      t.date :first_appointment_to_present_position
      t.date :promotion_to_present_grade      
      t.date :confirmation_date
      t.timestamps
    end
  end

  def self.down
    drop_table :user_services
  end
end
