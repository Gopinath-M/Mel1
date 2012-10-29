class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.string :ic_number
      t.string :first_name
      t.string :last_name
      t.string :username
      t.integer :substantive_post_id      
      t.integer :service_level_id
      t.integer :classification_id
      t.integer :grade_id
      t.integer :salary_id
      t.integer :salary_standard_id
      t.integer :appointment_id
      t.string :position
      t.string :official_position     
      t.string :gender
      t.text :address
      t.text :address
      t.string :city
      t.integer :zipcode
      t.string :state
      t.string :contact_phone
      t.string :contact_mobile
      t.string :fax_number
      t.date :first_appointment_to_public_service
      t.date :first_appointment_to_present_position
      t.date :promotion_to_grad_now
      t.date :confirmation_date_to_post_now
      t.date :date_of_join
      t.date :date_of_birth    
      t.integer :created_by
      t.integer :updated_by
      t.string :avatar
      t.datetime :avatar_updated_at
      t.string :status
      t.boolean :deleted, :default => false
      t.column :activation_code, :string, :limit => 40
      t.column :activated_at, :datetime
      t.boolean :widget_one, :default => 1
      t.boolean :widget_two, :default => 1
      t.boolean :profile_status, :default => 0
      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
  end

  def self.down
    drop_table :users
  end
end
