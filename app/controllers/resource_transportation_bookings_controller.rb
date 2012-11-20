class ResourceTransportationBookingsController < ApplicationController

  def index
    @resource_transportation_bookings = ResourceTransportationBooking.all#where("requester_id = #{current_user.id}")
  end

  def new
    @resource_transportation_booking = ResourceTransportationBooking.new
  end

  def create
    @resource_transportation_booking = ResourceTransportationBooking.new(params[:resource_transportation_booking])
    if @resource_transportation_booking.valid?
      @resource_transportation_booking.status = "New"
      @resource_transportation_booking.requester_id = current_user.id
      @resource_transportation_booking.save
      redirect_to resource_transportation_bookings_path
    else
      render :action=>'new'
    end
  end

  # For Approval
  def approve_request
    @resource_transportation_bookings = ResourceTransportationBooking.all
  end

  def show
    @resource_transportation_booking = ResourceTransportationBooking.find(params[:id])
    @requester = User.find("#{@resource_transportation_booking.requester_id}")
  end

  # Changing the status of the Resource Transportation Booking
  def change_resource_status
    @resource_transportation_booking = ResourceTransportationBooking.find(params[:id])
    @resource_transportation_booking.update_attribute(:status,params[:approve_status])
    redirect_to approve_request_resource_transportation_bookings_path
  end
  
end
