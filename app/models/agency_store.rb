class AgencyStore < ActiveRecord::Base
#  has_many :resource_bookings, :as=>:bookable
  belongs_to :agency  
  has_many :resource_transportation_bookings
  scope :active, where(:is_active => true, :deleted => false)
end
