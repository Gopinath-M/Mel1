class DashboardController < ApplicationController
 
  before_filter :authenticate_user!
#  layout 'main_content'
  def index
    if current_user.role_id == 1
     @users=User.all(:conditions=>["role_id = 2"])
    elsif current_user.role_id == 2
       @users=User.all(:conditions=>["role_id = 3"])
    else
@users=User.all(:conditions=>["role_id = 3"])
  end
  end
end
