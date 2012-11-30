class ResourceRoomBookingsController < ApplicationController
  #  before_filter :authenticate_user!
  #  before_filter :is_admin
  
  def index
    if current_user && current_user.is_super_admin?
      @resource_room_booking = ResourceRoomBooking.all
    elsif current_user && current_user.is_resource_manager?
      @resource_room_bookings = ResourceRoomBooking.find_all_by_status("Approved")
    else
      @resource_room_bookings = ResourceRoomBooking.where(:user_id => current_user.id).order.page(params[:page]).per(5) 
    end
  end

  def new
    @resource_room_booking = ResourceRoomBooking.new()
    @booking = CategoriesDepartment.where(:category_id=> "6", :department_id=> current_user.departments.first.id)
  end

  def edit
    @resource_room_booking= ResourceRoomBooking.find(params[:id])
  end

  def show
    if !params[:id].nil?
      @resource_room_booking = ResourceRoomBooking.find(params[:id])
      @resource = SubCategory.find_by_id(@resource_room_booking.sub_category_id)
      @user = User.find_by_id(@resource_room_booking.user_id)
      @dept = Department.find_by_id(default_department)
      @agencystore = AgencyStore.find_by_sub_category_id(@resource_room_booking.sub_category_id)
      @agency= Agency.find_by_id(@agencystore.agency_id)
      @manager= User.find_by_id(@agency.user_id)
    end
  end

  def create
    p params[:resource_room_booking][:resource_id]
    agency = AgencyStore.find_by_resource_id(params[:resource_room_booking][:resource_id])
    if !agency.nil?
    if agency.booked == false
      agency.update_attribute(:booked, true)
      @resource_room_booking = ResourceRoomBooking.create(params[:resource_room_booking])
      @resource_room_booking.agency_store_id = agency.id
      @resource_room_booking.status = "New"
      @resource_room_booking.user_id = params[:user_id]
      @resource_room_booking.department_id = params[:department_id]
      @resource_room_booking.save
      redirect_to(resource_room_bookings_path, :notice => "Resource Room booking has been created.")
    else
      redirect_to(new_resource_room_booking_path, :notice => "You cant book the Already Reserved Resource.")
    end
    else
      redirect_to(new_resource_room_booking_path, :notice => "Resource selected is not available in your Agency Store, Are you want this as resource requistion.")
    end
  end

  def update
    @resource_room_booking = ResourceRoomBooking.find(params[:id]) if params[:id]
    if @resource_room_booking.update_attributes(params[:resource_room_booking])
      redirect_to(resource_room_bookings_path, :notice => 'Resource Room Booking has been successfully updated.')
    else
      render :action=>'new'
    end
  end

  def get_list_of_facility
    facilities = Facility.find_all_by_resource_id(params[:resource_id])
    render :json=>[facilities] if facilities
  end

  def list_resource_booking
    if current_user.is_department_admin?
      @booking = ResourceRoomBooking.where(:department_id => current_user.departments).order.page(params[:page]).per(5)
    else
      @booking = ResourceRoomBooking.find_all_by_department_id(current_user.departments, :conditions => ["status != 'New'"])
    end
  end

  def update_room_booking
    room = ResourceRoomBooking.find_by_id(params[:resource_book_id])
    agency_store = AgencyStore.find_by_resource_id(params[:resource_id])
    if params[:resource_room_booking][:status] == "Returned" ||  params[:resource_room_booking][:status] == "Declined"
      agency_store.update_attribute(:booked, false)
    end
    @resource_room_booking = ResourceRoomBooking.find_by_id(params[:resource_book_id])
    @resource_room_booking.update_attributes(params[:resource_room_booking])
    redirect_to(list_resource_booking_resource_room_bookings_path, :notice => 'Resource Room Booking Status has been successfully updated.')
  end

  def room_booking_approval
    if !params[:id].nil?
      @resource_room_booking = ResourceRoomBooking.find(params[:id])
      @resource = SubCategory.find_by_id(@resource_room_booking.sub_category_id)
      @user = User.find_by_id(@resource_room_booking.user_id)
      @dept = Department.find_by_id(default_department)
      @agencystore = AgencyStore.find_by_sub_category_id(@resource_room_booking.sub_category_id)
      @agency= Agency.find_by_id(@agencystore.agency_id)
      @manager= User.find_by_id(@agency.user_id)
    end
  end

  def user_return
    room = ResourceRoomBooking.find(params[:room_book_id])
    if params[:user_returned_status] == "true"
      room.update_attribute(:user_returned_status, true)
    else
      room.update_attribute(:user_returned_status, false)
    end
  end

  def get_resources
    if !params[:sub_category_id].nil?
      resoures = Resource.find_all_by_sub_category_id(params[:sub_category_id])
#      resoures = Resource.find_all_by_sub_category_id(category.sub_category_id)
      render :json=>[resoures] if resoures
    end
  end

  def get_details_for_resource
    p  resources = Resource.find(params[:resource_id])
    render :json=>[resources] if resources
  end
  
end
