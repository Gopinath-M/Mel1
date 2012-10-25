class Department < ActiveRecord::Base
  #Associations come here
  has_many :role_memberships 
  has_many :roles 
  has_many :users, :through => :role_memberships
  belongs_to :agency
  #Validations comes here
  validates :name,:agency_id, :presence => true
  validates_uniqueness_of :name, :case_sensitive=>false, :if=>Proc.new {|u| !u.name.blank?}
  
  #named_scopes comes here
  scope :active, where(:is_active => true, :deleted => false)
end
