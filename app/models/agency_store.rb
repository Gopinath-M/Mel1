class AgencyStore < ActiveRecord::Base
#  has_many :resource_bookings, :as=>:bookable
  belongs_to :agency  
  has_many :resource_transportation_bookings

  validates :agency_id, :sub_category_id, :resource_id, :presence=>true
  scope :active, where(:is_active => true, :deleted => false)
end
