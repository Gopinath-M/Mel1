class AgencyStore < ActiveRecord::Base
#  has_many :resource_bookings, :as=>:bookable
  belongs_to :agency
  scope :active, where(:is_active => true, :deleted => false)
#  validates :quantity, :presence=>true
end
