class Event < ActiveRecord::Base
   mount_uploader :event_attachment, EventAttachmentUploader
  belongs_to :user

  validates :name, :from_date, :to_date, :venue, :organizer, :description, :event_attachment, :presence => true

  validates :is_active, :inclusion => {:in => [true, false]}

   validate :validate_booking_time

  def validate_booking_time
    errors.add(:base,"From Date Should be greater than current date and time") if self.from_date!=nil && self.from_date < Time.now
    errors.add(:base,"To Date Should be greater than current date and time") if self.to_date!=nil && self.to_date < Time.now
    errors.add(:base,"To Date Should be greater than From date and time") if self.from_date!=nil && self.to_date!=nil && self.from_date > self.to_date
    errors.add(:base,"From Date Should be greater than current date and time") if self.from_date!=nil && self.from_date < Time.now
    end
end
