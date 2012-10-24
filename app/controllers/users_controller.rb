class UsersController < ApplicationController
  before_filter :authenticate_user!, :except=>[:activate]
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
    if !params[:department_id].nil?
      department = Department.find_by_id(params[:department_id])
      @users = department.users.all
    else
      @users=User.order.page(params[:page]).per(15)
      @department_id=params[:department_id]
    end
    if request.xhr?
      render :layout=>false
    end
  end
  ## Transfer Department Function begins here
  def transfer
if !params[:department_id].nil? || !params[:department_id].blank?

      users= Department.find_by_id(params[:department_id]).users.where("role_id !=2")
      render :json=>[users] if users
end     
  end

 def update_transfer
   if params[:transfer][:username] != ""
    user = User.find_by_ic_number(params[:transfer][:username])
    departments = user.departments
    if params[:from_department][:id] != "" && params[:to_department][:id]!= ""
      s = Department.find_by_id(params[:department_id])
      if user.departments.include?(s)
        redirect_to(transfer_users_path, :notice => "You Cant transfer the User to Already exist department")
      else
        role = RoleMembership.find_by_user_id(user.id)
        role.update_attribute(:department_id, params[:department_id])
        department = Department.find_by_id(params[:department_id])
        UserMailer.intimate_user(user,department).deliver
        redirect_to(users_path, :notice => "#{user.first_name} has been transfer to #{department.name}.")
      end
    else
      redirect_to(transfer_users_path, :notice => "Please Select the Drop Box listed")
    end
   else
           redirect_to(transfer_users_path, :notice => "Please Select the Drop Box listed")

   end
  end
  ### Transfer Dept ends here
  def assign_department
    role = Role.where(:name => "Department User").first || Role.new
    @user = role.users
  end

  def update_assign
    role = RoleMembership.new(:department_id => params[:assign_department][:id], :user_id=> params[:standard][:user_id], :role_id => '3', :status => 'A')
    department = Department.find_by_id(params[:assign_department][:id])
    user = User.find_by_id(params[:standard][:user_id])
    if params[:standard][:user_d] != "" && params[:assign_department][:id] != ""
    if user.departments.include?(department)
      redirect_to(assign_department_users_path, :notice => "You cant Assign the User to Already exist department")
    else
      role.save
      #UserMailer.intimate_user_assign(user,department).deliver
      redirect_to(users_path, :notice => "#{user.first_name} has been assigned to #{department.name}. ")
    end
    else
      redirect_to(assign_department_users_path, :notice => "Please Select the Drop box listed")
    end
  end

  def activate
    current_user = params[:activation_code].blank? ? false : User.find_by_activation_code(params[:activation_code])
    if current_user && !user_signed_in? && !current_user.account_active?
      current_user.activate
      #      current_user.save_ip(request.remote_ip)
      redirect_to new_user_session_path,:notice => "Congratulations! Your account has now been activated!"
    else
      redirect_to :root
    end
  end

  def department_details
    
  end
end
