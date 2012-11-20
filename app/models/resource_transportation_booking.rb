class ResourceTransportationBooking < ActiveRecord::Base
  belongs_to :resource    
  validates :resource_id,:purpose,:number_of_passengers,:pick_up_place,:requested_from_date,:requested_to_date,:location, :presence => true
  mount_uploader :transport_avatar, TransportAvatarUploader
end
