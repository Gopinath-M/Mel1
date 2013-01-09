class ResourceRoomBooking < ActiveRecord::Base

  belongs_to :sub_category
  belongs_to :resource
  belongs_to :agency_store
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :department
  belongs_to :user , :class_name => "User", :foreign_key => "updated_by"

  validates :purpose,:remarks,:requested_from_date,:requested_to_date,:sub_category_id,:room_capacity, :presence => true
  validate :validate_booking_time, :on=>:create

  def validate_booking_time
    errors.add(:base,(I18n.translate!('errors_date.date_greater'))) if self.requested_from_date!=nil && self.requested_from_date<Time.now
    errors.add(:base,(I18n.translate!('errors_date.from_date_greater'))) if self.requested_to_date!=nil && self.requested_to_date<Time.now
    errors.add(:base,(I18n.translate!('errors_date.to_date_greater'))) if self.requested_from_date!=nil && self.requested_to_date!=nil && self.requested_from_date>self.requested_to_date
  end

  mount_uploader :room_attachment, RoomAttachmentUploader
end
