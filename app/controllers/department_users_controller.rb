require 'securerandom'
class DepartmentUsersController < ApplicationController
  before_filter :authenticate_user!
  def new
    @user=User.new
  end

  #Create new Department User
  def create
    password_token=password_friendly_token
    @user = User.create(params[:user].merge!({:password => password_token}))
    @user.save
    if @user.valid?
      UserMailer.welcomemail_department_user(@user,password_token).deliver
      redirect_to(users_path, :notice => 'User was added successfully.')
    else
      render :action=>'new'
    end
  end

  def index
    @users=nil
    if params[:department_id].blank? || params[:department_id].nil?
      @users=User.where("role_id !=1")
    else
      @users=User.where("role_id !=1 and department_id = ? ", params[:department_id])
      @department_id=params[:department_id]
    end
    if request.xhr?
      render :layout=>false
    end
  end
  
  def transfer
    if !params[:users].nil? && !params[:department_id].nil?
      @users=User.where("role_id !=1 and department_id = ? ", params[:department_id])
      if User.update_all("department_id=#{params[:department_id]}", "id in (#{users})")
        render :partial=>'transfer'
      else
        render :json=>"Error_code1"
      end
    else
      render :json=>"Error_code2"
    end
  end

  private
  def password_friendly_token
    SecureRandom.base64(8).tr('+/=lIO0', 'pqrsxyz')
  end
end
