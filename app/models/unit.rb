class Unit < ActiveRecord::Base
  #Association comes here
  has_many :role_memberships
  has_many :users, :through => :role_memberships

  attr_accessor :agency
  validates :agency, :name,:telephone_number,:address, :presence => true
  validates_uniqueness_of :name, :case_sensitive=>false, :if=>Proc.new {|u| !u.name.blank?}
  validates_format_of :telephone_number, :with=>/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/

  #Named scopes comes here
  scope :active, where(:is_active => true, :deleted => false)
  validates :department_id ,:presence=>true
end
