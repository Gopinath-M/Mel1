class SubCategory < ActiveRecord::Base

  before_validation :strip_whitespace
  validates :name,:category_id, :presence => true
  validates_uniqueness_of :name, :case_sensitive=>false, :if=>Proc.new {|u| !u.name.blank?}
  has_many :vehicles
  belongs_to :category
  has_many :resource_transportation_bookings

  scope :active, where(:is_active => true, :deleted => false)
  private
    def strip_whitespace
    self.name = self.name.strip
end
end
