require 'securerandom'
class DepartmentUsersController < ApplicationController

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

  private
  def password_friendly_token
    SecureRandom.base64(8).tr('+/=lIO0', 'pqrsxyz')
  end
end
