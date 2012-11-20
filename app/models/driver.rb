class Driver < ActiveRecord::Base
  #Associations
  has_many :vehicles

  #Validations
  validates :name,:telephone_number,:presence=> true
  validates_numericality_of :telephone_number
end
