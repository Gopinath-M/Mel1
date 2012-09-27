class ApplicationController < ActionController::Base
  protect_from_forgery

  def home
    if user_signed_in?
      redirect_to :controller => "dashboard", :action => "index"
    else
      redirect_to :controller => "sessions", :action => "new"
    end
  end
end
