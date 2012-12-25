class AgencyStore < ActiveRecord::Base
  #  has_many :resource_bookings, :as=>:bookable
  belongs_to :agency  
  belongs_to :resource
  belongs_to :sub_category
  belongs_to :category
  belongs_to :driver
  has_many :resource_ict_equipment_bookings
  has_many :resource_transportation_bookings

  #  validates_uniqueness_of :agency_id, :sub_category_id, :resource_id, :case_sensitive=>false
#  validates :resource_id, :uniqueness => {:scope => [:resource_id, :sub_category_id]}, :if=>Proc.new{|u| u.resource_type!="Room" || u.resource_type=="Transport" || u.resource_type=="Others" || (u.resource_type=="ICT" && u.serial_no=='')}
#  validates :serial_no, :uniqueness => {:scope => [:resource_id, :sub_category_id, :serial_no]}, :if=>Proc.new{|u| u.resource_type=="ICT" && u.serial_no!=''}
  validates :resource_id, :uniqueness => {:scope => [:resource_id, :sub_category_id, :agency_id]}, :if=>Proc.new{|u| u.resource_type=="Room"}
  scope :active, where(:is_active => true, :deleted => false)
end
