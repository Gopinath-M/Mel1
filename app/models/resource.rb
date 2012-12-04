class Resource < ActiveRecord::Base
  belongs_to :user
  belongs_to :department
  belongs_to :category
  belongs_to :sub_category
  has_many :resource_boookings
  has_many :resource_transport_bookings

#  attr_reader :type
  validates :sub_category_id, :presence=>true
  validates :resource_no, :presence=>true, :if=>Proc.new {|u| u.resource_type!="ict" }
  validates :name, :description, :brand_model ,:presence=>true, :if=>Proc.new {|u| u.resource_type=="ict" }
  validates :name, :length => { :minimum => 3 }, :if=>Proc.new {|u| !u.name.blank? && u.resource_type=="ict" }
  validates :description, :length => { :minimum => 10 }, :if=>Proc.new {|u| !u.description.blank? && u.resource_type=="ict" }
  validates :brand_model,:length => { :minimum => 4 }, :if=>Proc.new {|u| !u.brand_model.blank? && u.resource_type=="ict" }
  scope :active, where(:deleted => false)
end
