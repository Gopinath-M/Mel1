class Category < ActiveRecord::Base
  #  has_and_belongs_to_many :departments
  #Validation
  validates :name, :presence => true
  validates_uniqueness_of :name, :case_sensitive=>false, :if=>Proc.new {|u| !u.name.blank?}


  scope :active, where(:is_active => true, :deleted => false)

  #Association
  has_many :sub_categories
  has_many :departments, :through=>:categories_departments
  has_many :categories_departments
end
