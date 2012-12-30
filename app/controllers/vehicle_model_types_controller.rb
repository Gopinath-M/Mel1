class VehicleModelTypesController < ApplicationController
  before_filter :authenticate_user!
  def index
    if params[:id].blank? || params[:id].nil?
      @vehicle_model_type = VehicleModelType.page(params[:page]).per(10).order('created_at DESC')
    end
  end

  def create
    @vehicle_model_type = VehicleModelType.new(params[:vehicle_model_type])
    @vehicle_model_type.sub_category_id = params[:transport_agency][:sub_category_id]
    if @vehicle_model_type.valid?
      @vehicle_model_type.save
      redirect_to :controller=>'vehicle_model_types', :action=>'index'
    else
      render :action=>'new'
    end
  end

  def new
    @vehicle_model_type = VehicleModelType.new()
  end

  def show
  end

  def edit
    @vehicle_model_type= VehicleModelType.find(params[:id])
  end

  def update
    @vehicle_model_type = VehicleModelType.find(params[:id]) if params[:id]
    if @vehicle_model_type.update_attributes(params[:vehicle_model_type])
      redirect_to(vehicle_model_types_path, :notice => 'Vehicle Model Type has been successfully updated.')
    else
      render :action=>'new'
    end
  end

  def update_status
    @vehicle_model_type = VehicleModelType.find(params[:id])
    if params[:status]=="Activate"
      @vehicle_model_type.update_attribute(:is_active,true)
    elsif params[:status]=="Deactivate"
      @vehicle_model_type.update_attribute(:is_active,false)
    end
    redirect_to( vehicle_model_types_path, :notice => 'Vehicle Model Type Status has been successfully changed.')
  end

  def destroy
  end

end
