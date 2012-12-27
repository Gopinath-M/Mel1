class RoleMembership < ActiveRecord::Base
  #Associations comes here
  belongs_to :role
  belongs_to :user
  belongs_to :department
  belongs_to :unit
  attr_accessor :agency
  validates_associated :user, :if => Proc.new { |a| a.user.present? }
  #  validates :agency, :presence=>true
  validates :role_id, :presence => true
  validates :user_id, :presence => true
  validates :department_id, :presence => true, :if => Proc.new{|u| u.role_id!=1}
  validate :roles , :on=>:create

  def roles
    if self.role_id == 3
      departments = RoleMembership.where(:department_id => self.department_id, :role_id => 2)
      if departments && departments.empty?
        errors.add(:user, "Cannot create Department User without Department Admin")
      end
    elsif self.role_id == 2
      departments = RoleMembership.where(:department_id => self.department_id, :role_id => 2)
      if departments && !departments.empty?
        errors.add(:user, "cannot create Department Admin, Admin already exist for this Department")
      end
    end
  end

end
