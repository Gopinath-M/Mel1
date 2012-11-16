class Department < ActiveRecord::Base
#  has_and_belongs_to_many :categories
  #Associations come here
  has_many :role_memberships 
  has_many :roles 
  has_many :users, :through => :role_memberships
  belongs_to :agency
  has_many :categories_departments
  has_many :categories, :through => :categories_departments
  #Validations comes here
  validates :name,:agency_id, :presence => true
  validates_uniqueness_of :name, :case_sensitive=>false, :if=>Proc.new {|u| !u.name.blank?}
  
  #named_scopes comes here
  scope :active, where(:is_active=>true,:deleted => false).order("name asc")
  scope :all_undeleted, where(:deleted => false).order("name asc")
end
