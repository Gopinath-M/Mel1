class ResourceRoomBooking < ActiveRecord::Base

  validates :purpose,:remarks,:requested_from_date,:requested_to_date,:sub_category_id,:resource_id,:room_capacity, :presence => true
  validate :validate_booking_time, :on=>:create

  def validate_booking_time
    errors.add(:base,"From Date Should be greater than current date and time") if self.requested_from_date!=nil && self.requested_from_date<Time.now
    errors.add(:base,"To Date Should be greater than current date and time") if self.requested_to_date!=nil && self.requested_to_date<Time.now
    errors.add(:base,"To Date Should be greater than From date and time") if self.requested_from_date!=nil && self.requested_to_date!=nil && self.requested_from_date>self.requested_to_date
  end

  mount_uploader :room_attachment, RoomAttachmentUploader
end
