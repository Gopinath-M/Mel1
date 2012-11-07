class Resource < ActiveRecord::Base
  belongs_to :user
  belongs_to :department
  belongs_to :resource_category
  belongs_to :resource_sub_category
  has_many :vendors, :through => :resource_vendors
  has_many :resource_managers
  validates :name, :presence => true

   scope :active, where(:is_active => true, :deleted => false)
end
