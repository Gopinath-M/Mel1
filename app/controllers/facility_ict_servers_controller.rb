class FacilityIctServersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin

  def index
    if params[:id].blank? || params[:id].nil?
      @facility_ict_server = FacilityIctServer.page(params[:page]).per(10).order('created_at DESC')
    end
  end

  def create
    @facility_ict_server = FacilityIctServer.create(params[:facility_ict_server])
    @facility_ict_server.save
    if @facility_ict_server.valid?
      redirect_to :controller=>'facility_ict_servers', :action=>'index'
    else
      render :action=>'new'
    end
  end

  def new
    @facility_ict_server = FacilityIctServer.new()
  end

  def show
  end

  def edit
    @facility_ict_server = FacilityIctServer.find(params[:id])
  end

  def update
    @facility_ict_server = FacilityIctServer.find(params[:id]) if params[:id]
    if @facility_ict_server.update_attributes(params[:facility_ict_server])
      redirect_to(facility_ict_servers_path, :notice => 'Server has been successfully updated.')
    else
      render :action=>'new'
    end
  end

  def destroy
  end
end
