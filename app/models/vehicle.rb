class Vehicle < ActiveRecord::Base
  #Associations
  belongs_to :driver
  belongs_to :vehicle_type
  
  #Validations
  validates :model,:registration_number,:driver_id,:vehicle_type_id, :presence => true

end
