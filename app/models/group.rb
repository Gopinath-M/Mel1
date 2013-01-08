class Group < ActiveRecord::Base  
  has_many :group_members
  #has_many :users, :through => :group_members
  validates :name,:presence => true,:uniqueness=> true
end
