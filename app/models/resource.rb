class Resource < ActiveRecord::Base
  belongs_to :user
  belongs_to :department
  belongs_to :category
  belongs_to :sub_category
  has_many :vendors, :through => :resource_vendors
  has_many :resource_managers
  has_many :resource_boookings
  has_many :resource_transport_bookings
  validates :category_id, :presence=>true
  validates :sub_category_id, :presence=>true
  validates :name, :presence => true
  scope :active, where(:deleted => false)
end
