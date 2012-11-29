class SubCategory < ActiveRecord::Base
  validates :name,:category_id, :presence => true
  validates_uniqueness_of :name, :case_sensitive=>false, :if=>Proc.new {|u| !u.name.blank?}
  has_many :vehicles
  belongs_to :category
  has_many :resource_transportation_bookings

  scope :active, where(:is_active => true, :deleted => false)
end
