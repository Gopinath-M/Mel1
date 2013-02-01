class Group < ActiveRecord::Base  
  has_many :group_members
  #has_many :users, :through => :group_members
  validates :name,:presence => true,:uniqueness=> true
  scope :active, where(:is_active=>true,:deleted => false).order("name asc")
end
