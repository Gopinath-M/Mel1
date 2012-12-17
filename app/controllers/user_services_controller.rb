class UserServicesController < ApplicationController
  def index
    @user_services = UserService.all
  end

  def new
    @user_service = UserService.new
  end

  def create
    @user_service = UserService.new(params[:user_service])
    if @user_service.valid?
      @user_service.user_id = current_user.id
      @user_service.save
      redirect_to user_services_path
    else
      render :action => 'new'
    end    
  end

  def edit
  end

  def show
  end

end
