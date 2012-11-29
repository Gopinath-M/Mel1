class ResourceTransportationBookingsController < ApplicationController
  before_filter :authenticate_user!
  include ResourceTransportationBookingsHelper
  
  def index
    get_booking_records
  end

  def new
    @resource_transportation_booking = ResourceTransportationBooking.new    
    @category = CategoriesDepartment.where(:category_id=>7,:department_id=> current_user.departments.first.id)
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
    get_booking_records
  end

  def show
    @resource_transportation_booking = ResourceTransportationBooking.find(params[:id])
    @requester = User.find("#{@resource_transportation_booking.requester_id}")
  end

  def request_view
    @resource_transportation_booking = ResourceTransportationBooking.find(params[:id])
    @requester = User.find("#{@resource_transportation_booking.requester_id}")
  end

  # Changing the status of the Resource Transportation Booking
  def change_resource_status
    @resource_transportation_booking = ResourceTransportationBooking.find(params[:id])

    if params[:approve_status] == "Approved"
      approve_scenario(params[:id],params[:vehicle][:id])
    elsif params[:approve_status] == "Processed"
      if params[:driver][:name] && params[:driver][:name] != ''
        process_scenario_alternate_driver(params[:id],params[:driver][:name])
      else
        @resource_transportation_booking.update_attribute(:status,"Processed")
      end
    elsif params[:approve_status] == "Returned"
      return_scenario(params[:id])
    elsif params[:approve_status] == "Declined"      
      @resource_transportation_booking.update_attribute(:status,'Declined')      
    end
    
    redirect_to approve_request_resource_transportation_bookings_path
  end

  # Retrieve the Vehicles List for the Vehicle Type
  def get_vehicles
    vehicles = Vehicle.where(:vehicle_type_id => params[:vehicle_type_id])
    render :json=>[vehicles] if vehicles
  end

  # Retrieving Driver Details
  def get_driver_details
    @resource = Resource.find(params[:id])
    @driver = Driver.find(AgencyStore.find_by_resource_id(params[:id]).driver_id)
    
    render :layout => false
  end

  # Returning the resource once used
  def user_return_status
    @rtb = ResourceTransportationBooking.find(params[:id])
    @rtb.update_attribute(:resource_returned_from_user,true)
    render :layout => false
  end
  
end
