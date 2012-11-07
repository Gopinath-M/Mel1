class ResourceSubCategory < ActiveRecord::Base
  validates :name,:resource_category_id, :presence => true
  validates :name, :uniqueness => true

  has_many :resources
  belongs_to :resource_category

  scope :active, where(:is_active => true, :deleted => false)
end
