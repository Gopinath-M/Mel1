class Agency < ActiveRecord::Base

  has_many :departments
  has_many :resource_managers
  has_one :agency_store
  belongs_to :user
  before_validation :strip_whitespace

  
  #validations comes here
  validates :name,:address,:telephone_number, :presence => true
  validates_uniqueness_of :name, :case_sensitive=>false, :if=>Proc.new {|u| !u.name.blank?}
#  validates_format_of :telephone_number, :with=>/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
#  validates_format_of :fax_number, :with=>/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/, :if=>Proc.new{|u| !u.fax_number.blank?}
  validates_numericality_of :telephone_number, :presence=> true
  validates_numericality_of :fax_number, :allow_blank=>true
  validate :tel_number

  #named Scopes comes here
  scope :active, where(:is_active => true, :deleted => false)
  private
  def strip_whitespace
    self.name = self.name.strip
  end

  def tel_number
    if self.telephone_number.length > 10
      errors.add(:base, (I18n.translate!('errors_date.invalid_tel')))
    end
    if !self.fax_number.blank? && self.fax_number.length > 10
      errors.add(:base, (I18n.translate!('errors_date.invalid_fax')))
    end
  end
   
end

