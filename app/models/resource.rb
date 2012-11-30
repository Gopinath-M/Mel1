class Resource < ActiveRecord::Base
  belongs_to :user
  belongs_to :department
  belongs_to :category
  belongs_to :sub_category
  has_many :resource_boookings
  has_many :resource_transport_bookings
  
  validates :sub_category_id, :presence=>true
  scope :active, where(:deleted => false)
end
