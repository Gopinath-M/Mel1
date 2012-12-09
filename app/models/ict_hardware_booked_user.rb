class IctHardwareBookedUser < ActiveRecord::Base
  has_many :ict_hardware_booked_statuses
    belongs_to :user, :class_name => "User", :foreign_key => "user_id"
    belongs_to :officer, :class_name => "User", :foreign_key => "officer_id"
  belongs_to :approver, :class_name => "User", :foreign_key => "approver_id"

  accepts_nested_attributes_for :ict_hardware_booked_statuses
end
