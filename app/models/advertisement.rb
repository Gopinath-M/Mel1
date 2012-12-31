class Advertisement < ActiveRecord::Base
 
  mount_uploader :advertisement_attachment, AdvertisementAttachmentUploader
  belongs_to :user
  validates :web_link, :from_date, :to_date, :advertisement_attachment, :presence =>true

  validates :is_active, :inclusion => {:in => [true, false]}
  
  validate :validate_booking_time

    def validate_booking_time
    errors.add(:base,(I18n.translate!('errors_date.date_greater'))) if self.from_date!=nil && self.from_date.to_datetime < Time.now
    errors.add(:base,(I18n.translate!('errors_date.to_date_greater'))) if self.to_date!=nil && self.to_date.to_datetime < Time.now
    errors.add(:base,(I18n.translate!('errors_date.from_date_greater'))) if self.from_date!=nil && self.to_date.to_datetime!=nil && self.from_date.to_datetime > self.to_date.to_datetime
    errors.add(:base,(I18n.translate!('errors_date.date_greater'))) if self.from_date!=nil && self.from_date.to_datetime < Time.now
  end
end
