class DriversController < ApplicationController
  before_filter :authenticate_user!

  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def create
    @driver = Driver.new(params[:driver])
    if @driver.valid?
      @driver.save
      redirect_to drivers_path
    else
      render :action => 'new'
    end
  end

  def edit
  end

end
