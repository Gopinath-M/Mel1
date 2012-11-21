module ApplicationHelper

  #this will work if the user belongs to one department. We need to do for multiple departments #manivannan
  def current_department  
    @current_department ||= current_user.departments.first
  end
  
  #Get count for unactivated dept admin accounts
  def activate_admin_users_count
    user_count=User.joins(:roles).where("activation_code is not null and roles.name='#{DISP_USER_ROLE_DEPT_ADMIN}'").count
    return user_count
  end
  
  #Get count for unactivated dept user accounts
  def activate_department_users_count
    departments=RoleMembership.joins(:role).where("roles.name='#{DISP_USER_ROLE_DEPT_ADMIN}' and user_id=#{current_user.id}").collect(&:department_id)
    user_count=User.joins(:roles).where("activation_code is not null and roles.name='#{DISP_USER_ROLE_DEPT_USER}'  and role_memberships.department_id in (?) ", departments).count
    return user_count
  end

#  def default_department
#    default_department ||= current_user.role_memberships.first.default_dept
#  end
  def default_department
    default_department ||= current_user.role_memberships.where(:default_dept => true).first.department.id
  end

  def current_role
      department=Department.find(@current_department) if @current_department
      current_role=RoleMembership.find_by_user_id_and_department_id(current_user.id,department.id) if department
      current_role.role.name if current_role
  end

end
