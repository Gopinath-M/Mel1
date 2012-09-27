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
    @users=User.all
  end
end
