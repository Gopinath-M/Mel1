class DashboardController < ApplicationController
 
  before_filter :authenticate_user!
#  layout 'main_content'
  def index
    @users = User.all
  end

end
