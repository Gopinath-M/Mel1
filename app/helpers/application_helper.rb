module ApplicationHelper
  
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

end
