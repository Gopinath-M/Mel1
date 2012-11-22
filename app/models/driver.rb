class Driver < ActiveRecord::Base
  #Associations
  has_many :vehicles

  #Validations
  #validates :name,:telephone_number,:presence=> true
  #validates_numericality_of :telephone_number
  validates :name,:telephone_number,:presence=> true
  validates_format_of :telephone_number, :with=>/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/, :if=>Proc.new{|u| !u.telephone_number.blank?}

end
