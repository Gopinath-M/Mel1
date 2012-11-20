class VehicleType < ActiveRecord::Base
  #Associations
  has_many :vehicles

  #Validations
  validates :name, :presence=> true
end
