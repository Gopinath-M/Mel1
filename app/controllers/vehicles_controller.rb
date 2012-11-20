class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def show
  end

  def edit
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(params[:vehicle])
    if @vehicle.valid?
      @vehicle.save
      redirect_to vehicles_path
    else
      render :action => 'new'
    end
  end

end
