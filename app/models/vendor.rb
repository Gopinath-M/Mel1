class Vendor < ActiveRecord::Base

  has_many :resources, :through => :resource_vendors
  validates :name,:address, :presence => true
  validates :contact_no, :presence => true, :if=>Proc.new {|u| !u.name.blank?}
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :if=>Proc.new {|u| !u.email.blank?}
  validates_format_of :contact_no, :with=>/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/

  scope :active, where(:is_active => true)
end
