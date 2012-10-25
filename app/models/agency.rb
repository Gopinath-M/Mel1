class Agency < ActiveRecord::Base
  has_many :departments
  #validations comes here
  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates_uniqueness_of :name, :case_sensitive=>false, :if=>Proc.new {|u| !u.name.blank?}
  #named Scopes comes here
  scope :active, where(:is_active => true, :deleted => false)
   
end
