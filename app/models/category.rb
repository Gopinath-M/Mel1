class Category < ActiveRecord::Base
  #Validation
  validates :name, :presence => true

  
  scope :active, where(:deleted => false)

  #Association
  has_many :sub_categories
end
