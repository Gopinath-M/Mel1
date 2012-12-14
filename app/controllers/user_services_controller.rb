class UserServicesController < ApplicationController
  def index
    @user_service = UserService.all
  end

  def new
    @user_service = UserService.new
  end

  def edit
  end

  def show
  end

end
