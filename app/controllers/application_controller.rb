class ApplicationController < ActionController::Base
  protect_from_forgery

  def home
    if user_signed_in?
      redirect_to dashboard_index_path
    else
      redirect_to new_user_session_path
    end
  end

  def is_admin
    if !((current_user.roles.first.name=="Super Admin" || current_user.roles.first.name=="Department Admin") && current_user.role_memberships.first.status=="A")
      redirect_to dashboard_index_path
    end
  end

end
