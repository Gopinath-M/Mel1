class Vehicle < ActiveRecord::Base
  belongs_to :driver
  belongs_to :vehicle_type
end
