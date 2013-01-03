class IctVpn < ActiveRecord::Base
  validates :from_date, :presence => true
  validates :to_date, :presence => true

  has_many :system_accesses
  has_many :requisition_types
  belongs_to :user

  validates :requisition_type_id, :from_date, :to_date, :justification, :system_access_id, :note, :presence => true

  validate :validate_booking_time

  def validate_booking_time
    errors.add(:base,(I18n.translate!('errors_date.date_greater'))) if self.from_date.to_datetime!=nil && self.from_date.to_datetime < Time.now
    errors.add(:base,(I18n.translate!('errors_date.to_date_greater'))) if self.to_date.to_datetime!=nil && self.to_date.to_datetime < Time.now
    errors.add(:base,(I18n.translate!('errors_date.from_date_greater'))) if self.from_date!=nil && self.to_date!=nil && self.from_date > self.to_date
    errors.add(:base,(I18n.translate!('errors_date.date_greater'))) if self.from_date.to_datetime!=nil && self.from_date.to_datetime < Time.now
  end

  mount_uploader :vpn_attachment, VpnAttachmentUploader
end
