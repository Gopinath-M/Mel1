class ResourceCategory < ActiveRecord::Base
  #Validation
  validates :name, :presence => true

  
  scope :active, where(:is_active => true, :deleted => false)

  #Association
  has_many :resource_sub_categories
end
