class Advertisement < ActiveRecord::Base
 
  mount_uploader :advertisement_attachment, AdvertisementAttachmentUploader
  belongs_to :user
  validates :web_link, :from_date, :to_date, :advertisement_attachment, :presence =>true

  validates :is_active, :inclusion => {:in => [true, false]}
  
   validate :validate_booking_time

  def validate_booking_time
    errors.add(:base,"From Date Should be greater than current date and time") if self.from_date!=nil && self.from_date < Time.now
    errors.add(:base,"To Date Should be greater than current date and time") if self.to_date!=nil && self.to_date < Time.now
    errors.add(:base,"To Date Should be greater than From date and time") if self.from_date!=nil && self.to_date!=nil && self.from_date > self.to_date
    errors.add(:base,"From Date Should be greater than current date and time") if self.from_date!=nil && self.from_date < Time.now
    end
end
