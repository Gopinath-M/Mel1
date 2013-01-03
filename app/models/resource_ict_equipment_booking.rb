class ResourceIctEquipmentBooking < ActiveRecord::Base
  belongs_to :sub_category
  belongs_to :agency_store
  belongs_to :department
  belongs_to :resource
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :officer, :class_name => "User", :foreign_key => "officer_id"
  belongs_to :approver, :class_name => "User", :foreign_key => "approver_id"
  validates :sub_category_id,:agency_store_id,:purpose,:location, :requested_from_date, :requested_to_date,:meeting_start_time,:meeting_end_time, :presence=>true
  validates :purpose,:location, :length => { :minimum => 4 }, :if=>Proc.new {|u| !u.location.blank? || !u.purpose.blank? }
  validate :validate_booking_time, :on=>:create

  def validate_booking_time
    errors.add(:base,(I18n.translate!('errors_date.date_greater'))) if self.requested_from_date!=nil && self.requested_from_date<Time.now
    errors.add(:base,(I18n.translate!('errors_date.from_date_greater'))) if self.requested_to_date!=nil && self.requested_to_date<Time.now
    errors.add(:base,(I18n.translate!('errors_date.to_date_greater'))) if self.requested_from_date!=nil && self.requested_to_date!=nil && self.requested_from_date>self.requested_to_date
    errors.add(:base,(I18n.translate!('errors_date.from_meeting_time_greater'))) if self.meeting_start_time!=nil && self.meeting_start_time<Time.now
    errors.add(:base,(I18n.translate!('errors_date.to_meeting_time_greater'))) if self.meeting_end_time!=nil && self.meeting_end_time<Time.now
    errors.add(:base,(I18n.translate!('errors_date.to_meeting_greater_from'))) if self.meeting_start_time!=nil && self.meeting_end_time!=nil && self.meeting_start_time>self.meeting_end_time
    errors.add(:base,(I18n.translate!('errors_date.date_greater'))) if self.requested_from_date!=nil && self.requested_from_date<Time.now
    errors.add(:base,(I18n.translate!('errors_date.meeting_start_time'))) if self.requested_from_date!=nil && self.meeting_start_time!=nil  && self.meeting_start_time < self.requested_from_date
    errors.add(:base,(I18n.translate!('errors_date.meeting_end_time'))) if self.requested_to_date!=nil && self.meeting_end_time!=nil  && self.meeting_end_time > self.requested_to_date
  end
  
end
