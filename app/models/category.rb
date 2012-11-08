class Category < ActiveRecord::Base
  has_and_belongs_to_many :departments
  #Validation
  validates :name, :presence => true

  
  scope :active, where(:deleted => false)

  #Association
  has_many :sub_categories
end
