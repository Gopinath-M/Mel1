class SubCategory < ActiveRecord::Base
  validates :name,:category_id, :presence => true
  validates :name, :uniqueness => true

  has_many :resources
  belongs_to :category

  scope :active, where(:deleted => false)
end
