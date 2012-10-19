class Department < ActiveRecord::Base
  has_many :role_memberships
  has_many :roles
  has_many :users, :through => :role_memberships, :uniq => true
  validates :name, :presence => true
end
