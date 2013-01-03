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
  validate :roles 

  def roles
    #    if self.role_id == 1
    #      errors.add(:user, "cannot create Super Admin")
    p self.inspect
    p self.role_id
    if self.role_id == 2
      departments = RoleMembership.where(:department_id => self.department_id, :role_id => 2)
      if departments && !departments.empty?
        errors.add(:user, "cannot create Department Admin, Admin already exist for this Department")
      end
    elsif self.role_id == 3
      departments = RoleMembership.where(:department_id => self.department_id, :role_id => 2)
      if departments && departments.empty?
        errors.add(:user, "cannot create Department User without Department Admin")
      end
    elsif self.role_id == 5
      department = Department.find(self.department_id)
      departments = Department.where(:agency_id => department.agency_id, :is_active => true).collect(&:id) if department
      if department && department!=nil
        members = RoleMembership.where("department_id in (?) and role_id = 5", departments)
        p members.inspect
        if members && !members.empty?
          errors.add(:user, "cannot create Resource Manager, Manager already exists for this Agency")
        end
      else
        user_roles=RoleMembership.where(:user_id => self.user_id, :role_id => 5)
        if user_roles && !user_roles.empty?
          errors.add(:user, "cannot create Resource Manager, this user has already is a Resource Manager")
        end
      end
    end
  end

end
