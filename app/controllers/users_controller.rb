class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin

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

  def edit
    @user=User.find(params[:id])
  end
  
  #Destroy a particular User
  def destroy
    @user = User.find(params[:id])
    @user.deleted = true
    if @user.save
      redirect_to(users_path, :notice => 'User deleted successfully.')
    end
  end

  #List all Users
  def index
    @users=nil
    if params[:department_id].blank? || params[:department_id].nil?
       @users=User.active.order.page(params[:page]).per(15)#.where("role_id !=1")
    else
      @users=User.active.order.page(params[:page]).per(15)#.where("role_id !=1 and department_id = ? ", params[:department_id])
      @department_id=params[:department_id]
    end
    if request.xhr?
      render :layout=>false
    end
  end
  ## Transfer Department Function begins here
  def transfer
    if params[:department_id].blank? || params[:department_id].nil?
      @users=User.order.page(params[:page]).per(15).where("role_id !=1")
    else
      @users=User.order.page(params[:page]).per(15).where("role_id !=1 and department_id = ? ", params[:department_id])

      users= Department.find_by_id(params[:department_id]).users.where("role_id !=2")
      render :json=>[users] if users

      @department_id=params[:department_id]
    end
  end

  def update_transfer
    @user = User.find_by_ic_number(params[:transfer][:username])
    @role = RoleMembership.find_by_user_id(@user.id)
    @role.update_attribute(:department_id, params[:department_id])
    @department = Department.find_by_id(params[:department_id])
    UserMailer.intimate_user(@user,@department).deliver
    redirect_to(users_path, :notice => 'User has been transfer to Department.')
  end
  ### Transfer Dept ends here

end
