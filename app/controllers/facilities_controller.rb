class FacilitiesController < ApplicationController

  def index
    if params[:id].blank? || params[:id].nil?
      @facility = Facility.order.page(params[:page]).per(10)
    end
  end

  def new
    @facility = Facility.new()
  end

  def edit
    @facility = Facility.find(params[:id])
  end

  def create
    @facility = Facility.create(params[:facility])
    if @facility.valid?
      redirect_to(facilities_path, :notice => "Resource #{@facility.name} has been created.")
    else
      render :action=>'new'
    end
  end

  def update
    @facility = Facility.find(params[:id]) if params[:id]
    if @facility.update_attributes(params[:facility])
      redirect_to(facilities_path, :notice => "Resource #{@facility.name} has been updated.")
    else
      render :action=>'new'
    end
  end

  def update_status
    facility = Facility.find(params[:id])
    if facility && params[:status]=="Activate"
      facility.update_attribute(:is_active,true)
    elsif facility && params[:status]=="Deactivate"
      facility.update_attribute(:is_active,false)
    end
    redirect_to(rooms_path, :notice => "Facility for #{facility.name} has been updated.")
  end

end
