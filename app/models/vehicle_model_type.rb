class VehicleModelType < ActiveRecord::Base
  #Association
  belongs_to :sub_category
  
  #Model Validations
  validates :name,:sub_category, :presence => true
  validates :name, :uniqueness => {:scope => :sub_category_id}
  
  attr_accessible :name,:sub_category_id
  #Named scopes comes here
  scope :active, where(:is_active => true, :deleted => false)  
end
