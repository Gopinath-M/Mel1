class ApplicationController < ActionController::Base
  protect_from_forgery

  def home
    if user_signed_in?
      if !current_user.is_super_admin? && current_user.sign_in_count == 1 && current_user.created_by != 0 #User records which are created by super admin or dept admin has to change the password while they are logged in first time
        user = User.find_by_ic_number(current_user.ic_number)
        user.login_status = 1
        user.save
        redirect_to :controller => "registrations", :action => "privacy_setting"
      else
        user = User.find_by_ic_number(current_user.ic_number)
        user.login_status = 1
        user.save
        redirect_to :controller => "dashboard", :action => "index"
      end
    else
      redirect_to new_user_session_path
    end
  end
  
  #This method will keep the current_department object through out the application. If the user exist more than one department, then the selected department will be the current department object.
  #While the user first logged in, his default department will be the current department object. Hope this will works! but one thing we need to clear the session somewhere... #Manivannan
  def current_department
    if !current_user.is_super_admin?
      
      if !session[:department_id].nil?
        @current_department ||= session[:department_id]
      else
        @current_department ||= default_department
      end
    end
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
  
  #This method will work if the user himself change his default department. For Future use #Manivannan
  def default_department
    default_department ||= current_user.role_memberships.where(:default_dept => true).first.department.id
  end

end
