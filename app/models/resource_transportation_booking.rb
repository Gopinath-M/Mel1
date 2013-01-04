class ResourceTransportationBooking < ActiveRecord::Base
  #Upload 
  mount_uploader :attachment, TransportAvatarUploader
  
  #Associations
  #belongs_to :resource
  belongs_to :vehicle
  belongs_to :sub_category
  belongs_to :agency_store

  after_update :mail_to_user_regarding_transport_status_updates

  #Validations

  attr_accessible :status,:agency_store_id,:driver_id,:remarks,:state,:sub_category_id,:purpose,:number_of_passengers,:pick_up_place,:requested_from_date,:requested_to_date,:location,:attachment
  
  validates :remarks, :sub_category_id,:purpose,:number_of_passengers,:pick_up_place,:requested_from_date,:requested_to_date,:location,:state, :presence => true
  validates_numericality_of :number_of_passengers
  validate :validate_booking_time

  def validate_booking_time
    errors.add(:base,(I18n.translate!('errors_date.date_greater'))) if self.requested_from_date!=nil && self.requested_from_date<Time.now
    errors.add(:base,(I18n.translate!('errors_date.from_date_greater'))) if self.requested_to_date!=nil && self.requested_to_date<Time.now
    errors.add(:base,(I18n.translate!('errors_date.to_date_greater'))) if self.requested_from_date!=nil && self.requested_to_date!=nil && self.requested_from_date>self.requested_to_date
  end

  def mail_to_user_regarding_transport_status_updates
    user = User.find(self.requester_id)
    UserMailer.send_mail_to_user_for_transport_booking(user,self).deliver
  end
end
