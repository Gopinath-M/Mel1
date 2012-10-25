class Agency < ActiveRecord::Base
  #validations comes here
  validates :name, :presence => true
  validates :name, :uniqueness => true

  #named Scopes comes here
  scope :active, where(:is_active => true, :deleted => false)
   
end
