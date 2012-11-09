class Agency < ActiveRecord::Base
  has_many :departments
  has_many :resource_managers
  #validations comes here
  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates_uniqueness_of :name, :case_sensitive=>false, :if=>Proc.new {|u| !u.name.blank?}
  has_one :agency_store
  #named Scopes comes here
  scope :active, where(:is_active => true, :deleted => false)
   
end
