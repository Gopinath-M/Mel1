class ApplicationController < ActionController::Base
  protect_from_forgery

  def home
    if user_signed_in?
      redirect_to :controller => "users", :action => "index"
    else
      redirect_to :controller => "sessions", :action => "new"
    end
  end

  def is_admin
    if current_user.role_id!=1 && current_user.role_id!=2
      redirect_to :controller => "dashboard", :action => "index"#, :notice => "You are not autherized to access this page"
    end
  end
end
