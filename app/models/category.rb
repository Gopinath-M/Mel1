class Category < ActiveRecord::Base
  has_and_belongs_to_many :departments
  #Validation
  validates :name, :presence => true

  
  scope :active, where(:is_active => true, :deleted => false)

  #Association
  has_many :sub_categories
  has_many :categories_departments
end
