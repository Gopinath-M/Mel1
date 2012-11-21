class Unit < ActiveRecord::Base
  attr_accessor :agency
  validates :agency, :presence=>true
  #validations here
  validates :name, :presence => true
  validates_uniqueness_of :name, :case_sensitive=>false, :if=>Proc.new {|u| !u.name.blank?}

  #Named scopes comes here
  scope :active, where(:is_active => true, :deleted => false)
  validates :department_id ,:presence=>true

  #Association comes here
   has_many :role_memberships
   has_many :users, :through => :role_memberships
end
