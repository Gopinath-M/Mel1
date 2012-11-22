class Vehicle < ActiveRecord::Base
  #Associations
  belongs_to :driver
  belongs_to :agency_store
  belongs_to :vehicle_type
  has_many :resource_transportation_bookings
  
  #Validations
  validates :model_name,:registration_number,:driver_id,:vehicle_type_id, :presence => true
end
