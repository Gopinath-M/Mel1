module ApplicationHelper
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end
  #  def link_to_remove_fields(name, form,title)
  #    form.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  #  end
  #
  #  def link_to_add_fields(name, form, association)
  #    new_object = form.object.class.reflect_on_association(association).klass.new
  #    fields = form.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
  #      render(association.to_s.singularize + "_fields", :form => builder)
  #    end
  #    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  #  end
  
  def current_department
    if !current_user.is_super_admin?
      if !session[:department_id].nil?
        @current_department ||= session[:department_id]
      else
        @current_department ||= default_department
      end
    end
  end

  def get_officers(requested_user)
    department_users=RoleMembership.where("department_id=?",@current_department).collect(&:user_id)
    officer_ids=department_users-[requested_user,current_user.id]
    User.where("id in (?)", officer_ids)
  end
  
  def get_department_users
    p "=============dept users"

    department_users=RoleMembership.where("department_id=?",@current_department).collect(&:user_id)
    user_ids=department_users-[current_user.id]
    p users=User.where("id in (?)", user_ids)
    return users
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

  def except_current_user
    @users = current_department.users - [current_user] #all users except current_user
  end

  def resource_room_status_count(status)
    status_count=ResourceRoomBooking.find_all_by_department_id_and_status(@current_department, status).count
    return status_count
  end

  def resource_ict_status_count(status)
    status_count=ResourceIctEquipmentBooking.find_all_by_department_id_and_status(@current_department, status).count
    return status_count
  end

  def resource_status_count(status)
    status_count=ResourceBooking.find_all_by_department_id_and_status(@current_department, status).count
    return status_count
  end
end
