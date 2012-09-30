class UsersController < ApplicationController
  before_filter :authenticate_user!

  #Activate or Deactivate a particular User
  def update_status
    @user = User.find(params[:id])
    if params[:status]=="Activate"
      @user.update_attribute(:status,"Active")
    elsif params[:status]=="Deactivate"
      @user.update_attribute(:status,"Deactive")
    end
    department_id= !params[:department_id].blank? || !params[:department_id].nil? ?  params[:department_id] : nil
    redirect_to(users_path(:department_id=>department_id), :notice => 'User Status has been successfully changed.')
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
    if params[:department_id].blank? || params[:department_id].nil?
      @users=User.where(:is_admin=>0)
    else
      @users=User.where(:department_id=>params[:department_id], :is_admin=>0)
      @department_id=params[:department_id]
    end
    if request.xhr?
      render :layout=>false
    end
  end
end
