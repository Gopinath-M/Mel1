class ApplicationController < ActionController::Base
  protect_from_forgery

  def home
    if user_signed_in?
      redirect_to dashboard_index_path
    else
      redirect_to new_user_session_path
    end
  end

end
