class IctHardwareBooking < ActiveRecord::Base
  belongs_to :facility_ict
  belongs_to :booker, :class_name => "User", :foreign_key => "booker_id"

  has_many :ict_hardware_booked_users
  accepts_nested_attributes_for :ict_hardware_booked_users#, :reject_if => proc { |attributes| attributes['title'].blank? }
end
