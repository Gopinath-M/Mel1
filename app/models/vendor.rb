class Vendor < ActiveRecord::Base
  validates :name, :presence => true
  validates :contact_no, :presence => true

  has_many :resources, :through => :resource_vendors
end
