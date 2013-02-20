require 'securerandom'

class DepartmentUsersController < ApplicationController
  before_filter :authenticate_user!, :except=>[:get_departments,:get_units]
  def new
    if params[:admin]
      @admin = params[:admin]
    end
    @user=User.new
  end

  #Create new Department User
  def create
    if params[:user_role] == "admin"
      dept = Department.find(params[:users][:department])
      p user = dept.users.active.where("role_id = 2")
      if !user.present?
        password_token=password_friendly_token
        @user = User.create(params[:user].merge!({:password => password_token}))
        @user.ic_number = params[:num1] + params[:num2] + params[:num3]  # to get ic number as 3 parts
        if params[:user_role]=="admin"
          @admin='admin'
        end
        if @user.valid?
          role_member = @user.role_memberships.new(:role_id=> params[:role][:id], :department_id=>params[:users][:department],:unit_id=>params[:users][:unit], :default_dept=>true,:status=>STATUS_ACTIVE)
          if role_member.valid?
            @user.save
            role_member.save
            if role_member.role_id == 5
              department = Department.find(role_member.department_id)
              department.agency.update_attribute(:user_id, @user.id) if department
            end
            @user.activate_user
            #UserMailer.welcomemail_department_user(@user,password_token).deliver
            Stalker.enqueue("#{SPREFIX}.send.welcome", :id => @user.id, :password=> password_token)
            if @user.roles && !@user.roles.empty? && @user.roles.first.name == DISP_USER_ROLE_DEPT_ADMIN
              redirect_to(admin_users_path, :notice => 'Department Admin was added successfully.')
            end
          else
            User.destroy(@user.id)
            @errors = role_member.errors.full_messages.to_sentence
            render :action=>'new',:admin=>'admin'
          end
        else
          render :action=>'new',:admin=>'admin'
        end
      else
        redirect_to(new_department_user_path(:admin=>'admin'), :alert => "Sorry... Department Admin has already created for #{dept.name}.")
      end
    else
      password_token=password_friendly_token
      @user = User.create(params[:user].merge!({:password => password_token}))
      @user.ic_number = params[:num1] + params[:num2] + params[:num3]  # to get ic number as 3 parts
      if params[:user_role]=="admin"
        @admin='admin'
      end
      if @user.valid?
        role_member = @user.role_memberships.new(:role_id=> params[:role][:id], :department_id=>params[:users][:department],:unit_id=>params[:users][:unit], :default_dept=>true,:status=>STATUS_ACTIVE)
        if role_member.valid?
          @user.save
          role_member.save
          if role_member.role_id == 5
            department = Department.find(role_member.department_id)
            department.agency.update_attribute(:user_id, @user.id) if department
          end
          @user.activate_user
          #UserMailer.welcomemail_department_user(@user,password_token).deliver
          Stalker.enqueue("#{SPREFIX}.send.welcome", :id => @user.id, :password=> password_token)
          redirect_to(users_path, :notice => 'User was added successfully.')
        else
          User.destroy(@user.id)
          @errors = role_member.errors.full_messages.to_sentence
          render :action=>'new',:admin=>'admin'
        end
      else
        render :action=>'new',:admin=>'admin'
      end
    end
  end

  def index
    @users=nil
    if params[:department_id].blank? || params[:department_id].nil?
      @users=User.joins(:roles).where("roles.name!='Super Admin'")
    else
      @users=Department.find(params[:department_id]).users
      @department_id=params[:department_id]
    end
    if request.xhr?
      render :layout=>false
    end
  end

  def transfer
    if !params[:users].nil? && !params[:department_id].nil?
      users=params[:users].join(",").to_s
      @users=Department.find(params[:department_id]).users
      #@users=User.where("role_id !=1 and department_id = ? ", params[:department_id])
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
    departments=params[:agency_id] ? Department.active.where("agency_id =?",params[:agency_id]) : nil
    render :json=>[departments] if departments
  end

  def get_departments_for_user
    user=params[:user_id] ? User.find(params[:user_id]) : nil
    departments=user.departments.active.collect(&:name)
    render :json=>[departments] if departments
  end

  def get_units
    units=params[:department_id] ? Unit.active.where("department_id =?",params[:department_id]) : nil
    render :json=>[units] if units
  end

  def get_units_for_transfer
    units = params[:department_id] ? Unit.active.where("department_id =?",params[:department_id]) : nil
    render :json=>[units] if units
  end

  private

  def password_friendly_token
    SecureRandom.base64(8).tr('+/=lIO0', 'pqrsxyz')
  end

end
