class SubCategory < ActiveRecord::Base
  validates :name,:category_id, :presence => true
  validates_uniqueness_of :name, :case_sensitive=>false, :if=>Proc.new {|u| !u.name.blank?}

  has_many :resources
  belongs_to :category

  scope :active, where(:is_active => true, :deleted => false)
end
