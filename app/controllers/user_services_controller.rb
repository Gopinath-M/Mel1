class UserServicesController < ApplicationController
  before_filter :authenticate_user!
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
      redirect_to :controller => 'users', :action => 'emergency_reference'
    else
      render :action => 'new'
    end
  end

  def edit
    @user_service = UserService.find(params[:id])
  end

  def show
  end

  def update
    @user_service = UserService.find(params[:id]) if params[:id]
    if @user_service.present? && @user_service.update_attributes(params[:user_service])
      redirect_to :controller => 'users', :action => 'emergency_reference'
    else
      render :action => 'new'
    end
  end
end
