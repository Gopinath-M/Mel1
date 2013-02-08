class Department < ActiveRecord::Base
  #  has_and_belongs_to_many :categories
  #Associations come here

  before_validation :strip_whitespace
  has_many :role_memberships 
  has_many :roles 
  has_many :users, :through => :role_memberships
  belongs_to :agency
  has_many :categories_departments
  has_many :categories, :through => :categories_departments
  has_many :resource_ict_equipment_bookings
  #Validations comes here
  validates :agency_id,:name,:address,:telephone_number, :presence => true
  #  validates :name, :uniqueness => {:scope => [:agency_id, :name]}
  #  validates_uniqueness_of :name, :case_sensitive=>false, :if=>Proc.new {|u| !u.name.blank?}
#  validates_format_of :telephone_number, :with=>/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
#  validates_format_of :fax_number, :with=>/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/, :if=>Proc.new{|u| !u.fax_number.blank?}
  validates_numericality_of :telephone_number, :presence=> true
  validates_numericality_of :fax_number, :allow_blank=>true
  validate :tel_number
  
  #named_scopes comes here
  scope :active, where(:is_active=>true,:deleted => false).order("name asc")
  scope :all_undeleted, where(:deleted => false).order("name asc")
  def self.current_department
    Thread.current[:department]
  end
  def self.current_department=(user)
    Thread.current[:department] = user
  end
  #  define_index do
  #    indexes :name,  :sortable => true
  #  end
  #  sphinx_scope(:active) {
  #    {:is_active=>true,:deleted => false, :order => 'name DESC'}
  #  }
  private
  def strip_whitespace
    self.name = self.name.strip
  end

  def tel_number
    if !self.telephone_number.blank? && self.telephone_number.length > 10
      errors.add(:base, (I18n.translate!('errors_date.invalid_tel')))
    end
    if !self.fax_number.blank? && self.fax_number.length > 10
      errors.add(:base, (I18n.translate!('errors_date.invalid_fax')))
    end
  end

end
