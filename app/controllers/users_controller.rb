class UsersController < ApplicationController
  before_filter :authenticate_user!

  #Activate a particular User
  def activate
    @user = User.find(params[:id])
    @user.update_attribute(:status,"Active")
    redirect_to(users_path, :notice => 'User Activated successfully.')
  end

  #Deactivate a particular User
  def deactivate
    @user = User.find(params[:id])
    @user.update_attribute(:status,"Deactive")
    redirect_to(users_path, :notice => 'User Deactivated successfully.')
  end

  #Destroy a particular User
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(users_path, :notice => 'User deleted successfully.')
  end

  #List all Users
  def index
    @users=nil
    p "==========comes to users"
    p params[:department_id].blank?
    p params[:department_id].nil?
    if params[:department_id].blank? || params[:department_id].nil?
      @users=User.where(:is_admin=>0)
    else
      @users=User.where(:department_id=>params[:department_id])
    end
    p @users.inspect
    if request.xhr?
      render :layout=>false
    end
  end
end
