class IctVpn < ActiveRecord::Base

  has_many :system_accesses
  has_many :requisition_types
  belongs_to :user

  validates :requisition_type_id, :from_date, :to_date, :justification, :system_access_id, :note, :remarks, :presence => true

  validate :validate_booking_time

  def validate_booking_time
    errors.add(:base,(I18n.translate!('errors_date.from_date_greater'))) if self.from_date!=nil && self.to_date!=nil && self.from_date > self.to_date
  end

  mount_uploader :vpn_attachment, VpnAttachmentUploader
end
