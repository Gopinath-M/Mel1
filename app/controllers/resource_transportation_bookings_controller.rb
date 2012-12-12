class ResourceTransportationBookingsController < ApplicationController
  before_filter :authenticate_user!
  include ResourceTransportationBookingsHelper
  
  def index
    get_booking_records
  end

  def new
    @resource_transportation_booking = ResourceTransportationBooking.new
    if !current_user.is_super_admin?
      @category = CategoriesDepartments.where(:category_id => 7,:department_id => current_user.role_memberships.where(:default_dept => true).first.department.id)
      @sub_category = SubCategory.where(:category_id => 7,:is_available => true )
    end
    #@if_inside_agency = AgencyStore.where(:category_id=> 7,:booked=> false,:agency_id => current_user.departments.collect(&:agency_id).join(','))
  end

  def create
    @resource_transportation_booking = ResourceTransportationBooking.new(params[:resource_transportation_booking])
    if @resource_transportation_booking.valid?
      if !current_user.is_super_admin?
        @resource_transportation_booking.status = "New"
        @resource_transportation_booking.department_id = current_user.role_memberships.where(:default_dept => true).first.department.id
      else
        @resource_transportation_booking.status = "Processed"
        @resource_transportation_booking.department_id = '0'
        allocate_resource_for_super_admin_request(@resource_transportation_booking,params[:resource_transportation_booking][:sub_category_id])
      end
      @resource_transportation_booking.requester_id = current_user.id
      @resource_transportation_booking.requested_from_date = (params[:resource_transportation_booking][:requested_from_date]).to_datetime
      @resource_transportation_booking.requested_to_date = (params[:resource_transportation_booking][:requested_to_date]).to_datetime
      @resource_transportation_booking.save      
      redirect_to(resource_transportation_bookings_path, :notice => "Your Transport booking has been created sucessfully.")
    else
      if !current_user.is_super_admin?
        @category = CategoriesDepartments.where(:category_id=> 7,:department_id=> current_user.role_memberships.where(:default_dept => true).first.department.id)
        @sub_category = SubCategory.where(:category_id => 7,:is_available => true)
      end
      #@if_inside_agency = AgencyStore.where(:category_id=> 7,:booked=> false,:agency_id => current_user.departments.collect(&:agency_id).join(','))
      render :action=>'new'
    end
  end

  # For Approval
  def approve_request
    #get_booking_records
    #    if current_user.is_department_admin?
    #      @resource_transportation_bookings = ResourceTransportationBooking.find_all_by_department_id(current_user.departments)
    #    else
    #      @resource_transportation_bookings = ResourceTransportationBooking.find(:all, :conditions => ["status != 'New'"])
    #    end
    if current_user.is_resource_manager?
      @resource_transportation_bookings = ResourceTransportationBooking.find(:all, :conditions => ["status != 'New'"])
      #@resource_transportation_bookings = ResourceTransportationBooking.find_all_by_department_id(current_user.departments, :conditions => ["status != 'New'"])
    else
      @approver = Approver.active.find_all_by_department_id(current_user.departments).first
      @approver_second = Approver.active.find_all_by_department_id(current_user.departments).last
      if @approver.present? && @approver.user_id == current_user.id
        @resource_transportation_bookings = ResourceTransportationBooking.find_all_by_department_id(@approver.department_id)
      elsif @approver_second.present? && @approver_second.user_id == current_user.id
        @resource_transportation_bookings = ResourceTransportationBooking.where(:department_id => @approver_second.department_id)
      else
        @resource_transportation_bookings = ResourceTransportationBooking.where(:department_id => current_user.departments)
      end
    end
  end

  def show
    @resource_transportation_booking = ResourceTransportationBooking.find(params[:id])
    @requester = User.find("#{@resource_transportation_booking.requester_id}")
  end

  def request_view
    @resource_transportation_booking = ResourceTransportationBooking.find(params[:id])
    @requester = User.find("#{@resource_transportation_booking.requester_id}")
  end

  # Resource Transportation Booking Tracking Method
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
      if @resource_transportation_booking.status == "Approved"
        decline_scenario(params[:id])      
      end
      @resource_transportation_booking.update_attribute(:status,'Declined')
    end
    
    redirect_to(approve_request_resource_transportation_bookings_path, :notice => 'Transport Booking Status has been successfully updated.')
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

  def download_attachments
    @message = ResourceTransportationBooking.find(params[:id])
    send_file @message.attachment.path
  end
  
end
