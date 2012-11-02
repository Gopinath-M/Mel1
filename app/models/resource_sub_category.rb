class ResourceSubCategory < ActiveRecord::Base
  validates :name,:resource_category_id, :presence => true


  belongs_to :resource_category
end
