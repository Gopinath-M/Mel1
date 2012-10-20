class RoleMembership < ActiveRecord::Base
  #Associations comes here
  belongs_to :role
  belongs_to :user
  belongs_to :department
end
