class IctHardwareBookedUser < ActiveRecord::Base
  #  has_many :ict_hardware_booked_statuses
  belongs_to :ict_hardware_booking
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :officer, :class_name => "User", :foreign_key => "forward_to"

  #  accepts_nested_attributes_for :ict_hardware_booked_statuses

  validates :user_id, :presence=>true
  validate :booking
  
  def booking
    errors.add(:base,(I18n.translate!('errors_date.hardware_replace'))) if self.is_replacement.nil?
    errors.add(:base,(I18n.translate!('errors_date.select_one_hardware'))) if self.pc.blank? && self.printer.blank? && self.scanner.blank?
  end

#  after_save :update_status_and_remarks
#  def update_status_and_remarks
#    status = ApplicationStatus.create(:module_name => MODULE_NAME_REQUISITON, :module_type => MODULE_TYPE_REQ_HARDWARE, :module_resource_id => self.id, :status => self.status, :remarks => self.remarks, :notify_recipient => 1)
#    return status
#  end
end
