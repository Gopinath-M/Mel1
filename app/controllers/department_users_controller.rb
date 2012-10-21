require 'securerandom'
class DepartmentUsersController < ApplicationController
  before_filter :authenticate_user!, :except=>[:get_departments,:get_units]
  def new
    @user=User.new
  end

  #Create new Department User
  def create
    password_token=password_friendly_token
    @user = User.create(params[:user].merge!({:password => password_token}))
    @user.save
    if @user.valid?
      @user.role_memberships.create(:role_id=>params[:role][:id], :department_id=>@user.department_id,:status=>"A")
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
      users=params[:users].join(",").to_s
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

  def get_departments
    departments=params[:agency_id] ? Department.where("agency_id =? and is_active=?",params[:agency_id], 1) : nil
    render :json=>[departments] if departments
  end

  def get_units
    units=params[:department_id] ? Unit.where("department_id =? and is_active=?",params[:department_id], 1) : nil
    render :json=>[units] if units
  end
  
  private
  def password_friendly_token
    SecureRandom.base64(8).tr('+/=lIO0', 'pqrsxyz')
  end


end
