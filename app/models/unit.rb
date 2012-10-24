class Unit < ActiveRecord::Base
  #validations here
  validates :name, :presence => true
  
  #named Scopes comes here
  scope :active, where(:is_active => true, :deleted => false)
  validates :department_id ,:presence=>true
  
end
