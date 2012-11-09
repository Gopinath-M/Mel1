class ResourceBookingsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @resource_booking=ResourceBooking.new
  end

  def create
    @resource_booking=ResourceBooking.create(params[:resource_booking])
    @resource_booking.user_id=current_user.id
    @resource_booking.save
    if @resource_booking.valid?
      redirect_to resource_bookings_path
    else
      render :action=>'new'
    end
  end


  def edit
    @resource_booking=ResourceBooking.find(params[:id])
    @resource=Resource.find(@resource_booking.resource_id)
  end

  def update
    @resource_booking=ResourceBooking.find(params[:id]) if params[:id]
    @resource=Resource.find(@resource_booking.resource_id)
    if @resource_booking.update_attributes(params[:resource_booking])
      redirect_to(resource_bookings_path, :notice => 'Resource Bookings has been successfully updated.')
    else
      render :action=>'new'
    end    
  end

  def index
    @resource_bookings=ResourceBooking.where(:user_id=>current_user.id)
  end

  def show
    @resource_booking=ResourceBooking.find(params[:id])
    @resource=Resource.find(@resource_booking.resource_id)
  end

end
