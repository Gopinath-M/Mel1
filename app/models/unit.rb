class Unit < ActiveRecord::Base
  #validations here
  validates :name, :presence => true
  validate_uniqueness_of :name, :case_sensitive=>false, :if=>Proc.new {|u| !u.name.blank?}
  #named Scopes comes here
  scope :active, where(:is_active => true, :deleted => false)
  validates :department_id ,:presence=>true
end
