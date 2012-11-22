class ResourceTransportationBookingsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    if current_user && current_user.is_super_admin?
      @resource_transportation_bookings = ResourceTransportationBooking.all
    elsif current_user && current_user.is_resource_manager?
      @resource_transportation_bookings = ResourceTransportationBooking.find_all_by_status("Approved")
    else
      @resource_transportation_bookings = ResourceTransportationBooking.find(:all,:conditions=>[("requester_id = '#{current_user.id}' and (status = 'New' or status = 'Approved' or status = 'Declined')")])
    end
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
    if params[:approve_status] == "Approved"
      if params[:driver][:id] && params[:driver][:id] != ''
        @agency_store = AgencyStore.find_by_vehicle_id(params[:vehicle][:id])
        @agency_store.update_attribute(:booked,true)
        @resource_transportation_booking.update_attributes(:status => params[:approve_status],
                                                           :transport_store_id => @agency_store.id,
                                                           :driver_id => params[:driver][:id])
      else
        @resource_transportation_booking.update_attribute(:status,params[:approve_status])
      end
    elsif params[:approve_status] == "Returned"
      @resource_transportation_booking = ResourceTransportationBooking.find(params[:id])
      @agency_store = AgencyStore.find(@resource_transportation_booking.transport_store_id)
      @agency_store.update_attribute(:booked, false)
      @resource_transportation_booking.update_attribute(:status,"Returned")
    else
      @resource_transportation_booking = ResourceTransportationBooking.find(params[:id])
      @resource_transportation_booking.update_attributes(:status => params[:approve_status])
    end
    redirect_to approve_request_resource_transportation_bookings_path
  end

  # Retrieve the Vehicles List for the Vehicle Type
  def get_vehicles
    vehicles = Vehicle.where(:vehicle_type_id => params[:vehicle_type_id])
    render :json=>[vehicles] if vehicles
  end
  
end
