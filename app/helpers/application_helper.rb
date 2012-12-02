module ApplicationHelper

  def current_department
    if !current_user.is_super_admin?
      if !session[:department_id].nil?
        @current_department ||= session[:department_id]
      else
        @current_department ||= default_department
      end
    end
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
    if current_user && (!current_user.is_super_admin?)
      department=Department.find(@current_department) if @current_department
      current_role=RoleMembership.find_by_user_id_and_department_id(current_user.id,department.id) if department
      return current_role.role.name if current_role
    elsif current_user && current_user.is_super_admin?
      current_role=Role.find_by_name(DISP_USER_ROLE_SUPER_ADMIN)
      return current_role.name if current_role
#    elsif  current_user && current_user.is_resource_manager?
#      current_role=Role.find_by_name(DISP_USER_ROLE_RESOURCE_MANAGER)
#      return current_role.name if current_role
    end
  end

end
