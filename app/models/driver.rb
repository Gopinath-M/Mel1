class Driver < ActiveRecord::Base
  #Associations
  has_many :vehicles

  #Validations  
  validates :name,:telephone_number,:presence=> true,:uniqueness => true  
#  validates_format_of :telephone_number, :with=>/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/, :if=>Proc.new{|u| !u.telephone_number.blank?}
  validates_numericality_of :telephone_number, :presence=> true
  validate :tel_number

  scope :active, where(:is_active => true, :deleted => false)

  def tel_number
    if self.telephone_number.length > 10
      errors.add(:base, (I18n.translate!('errors_date.invalid_tel')))
    end
  end

end
