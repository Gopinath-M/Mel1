class ApplicationController < ActionController::Base
  protect_from_forgery

  def home
    if user_signed_in?
      if !current_user.is_super_admin? && current_user.sign_in_count == 1
        redirect_to :controller => "registrations", :action => "privacy_setting"
      else
        redirect_to :controller => "dashboard", :action => "index"
      end
    else
      redirect_to new_user_session_path
    end
  end
  #this will work if the user belongs to one department. We need to do for multiple departments #manivannan
  def current_department  
    @current_department ||= current_user.departments.first
  end

  # this method is for restricting user from login before super admin approves him. Since it has to be needed some tweaks, i am commenting this for timebeing #manivannan
  #def validate_user_role_membership  
  # if (current_user.present? && current_department.present?)
  #rm = current_user.role_memberships.where(:department_id => current_department.id).first
  #if not rm.nil?
  # if rm.status == STATUS_INACTIVE
  #sign_out(current_user)
  #render :template => "errors/blocked.html.erb"
  #end
  #end
  #end
  #end    

  def is_admin
    if current_user && !((current_user.roles.first.name=="Super Admin" || current_user.roles.first.name=="Department Admin") && current_user.role_memberships.first.status=="A")
      redirect_to dashboard_index_path
    end
  end
  
  def default_department
    default_department ||= current_user.role_memberships.first.default_dept
  end
end
