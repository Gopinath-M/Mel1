class ResourceBooking < ActiveRecord::Base
  mount_uploader :attachment, ResourceImageUploader

#  attr_accessor :category_id,:sub_category_id
  
  #  belongs_to :bookable, :polymorphic=>true
  belongs_to :resource
  belongs_to :department
  validate :validate_booking_time, :on=>:create

  def validate_booking_time
    errors.add(:base,"From Date Should be greater than current date and time") if self.requested_from_date!=nil && self.requested_from_date<Time.now
    errors.add(:base,"To Date Should be greater than current date and time") if self.requested_to_date!=nil && self.requested_to_date<Time.now
    errors.add(:base,"To Date Should be greater than From date and time") if self.requested_from_date!=nil && self.requested_to_date!=nil && self.requested_from_date>self.requested_to_date
   end
#  validates_integrity_of :attachment
#  validates_processing_of :attachment
#  validates :resource_id, :category_id, :sub_category_id, :name, :purpose, :description, :quantity, :requested_from_date, :requested_to_date, :presence=>true

end
