class ResourceRoomBookingsController < ApplicationController

  def index
    if params[:id].blank? || params[:id].nil?
      @resource_room_booking = ResourceRoomBooking.order.page(params[:page]).per(5)
    end
  end

  def new
    @resource_room_booking = ResourceRoomBooking.new()
  end

  def edit
    @resource_room_booking= ResourceRoomBooking.find(params[:id])
  end

  def create
    @resource_room_booking = ResourceRoomBooking.create(params[:resource_room_booking])
    @resource_room_booking.status = "New"
    @resource_room_booking.user_id = params[:user_id]
    @resource_room_booking.save
    if @resource_room_booking.valid?
      redirect_to(resource_room_bookings_path, :notice => "Resource Room booking has been created.")
    else
      render :action=>'new'
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
    room = Room.find_by_id(params[:room_id])
    facilities = Facility.find_all_by_room_id(room.id)
    render :json=>[facilities] if facilities
  end

  def list_resource_booking
    @booking = ResourceRoomBooking.order.page(params[:page]).per(5)
  end

  def update_room_booking
    @resource_room_booking = ResourceRoomBooking.find_by_id(params[:resource_book_id])
    @resource_room_booking.update_attribute(:status, params[:resource_room_booking][:status])
    redirect_to(list_resource_booking_resource_room_bookings_path, :notice => 'Resource Room Booking Status has been successfully updated.')
  end

  def room_booking_approval
    if !params[:id].nil?
      @resource_room_booking = ResourceRoomBooking.find(params[:id])
      @resource = Room.find_by_id(@resource_room_booking.room_type_id)
      @user = User.find_by_id(@resource_room_booking.user_id)
      @dept = Department.find_by_id(default_department)
      @agency = Agency.find_by_id(@dept.agency_id)
    end
  end
  
end
