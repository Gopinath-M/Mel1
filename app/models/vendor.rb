class Vendor < ActiveRecord::Base

  has_many :resources, :through => :resource_vendors
  validates :name,:address, :presence => true
  validates_numericality_of :contact_no, :presence=> true
  validate :tel_number
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :if=>Proc.new {|u| !u.email.blank?}
#  validates_format_of :contact_no, :with=>/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/

  scope :active, where(:is_active => true)

  def tel_number
    if self.contact_no.length > 10
      errors.add(:base, (I18n.translate!('errors_date.invalid_contact')))
    end
  end

end
