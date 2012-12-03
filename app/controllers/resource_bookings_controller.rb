class ResourceBookingsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @resource_booking=ResourceBooking.new
  end

  def create
    agency = AgencyStore.find_by_resource_id(params[:resource_booking][:resource_id])
     if !agency.nil?
      if agency.booked == false
    @resource_booking=ResourceBooking.create(params[:resource_booking])
    @resource_booking.user_id=current_user.id
    @resource_booking.agency_store_id = agency.id
    @resource_booking.status = "New"
    @resource_booking.save
    if @resource_booking.valid?
      redirect_to(resource_bookings_path, :notice => "Your Resource booking has been created sucessfully.")
    else
      render :action=>'new'
    end
    else
        redirect_to(new_resource_booking_path, :notice => "You cant book the Already Reserved Resource, Please try other.")
      end
    else
      redirect_to(new_resource_booking_path, :notice => "Resource selected is not available in your Store, Are you want this as resource requistion.")
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
    if !params[:id].nil?
    @resource_booking=ResourceBooking.find(params[:id])
    @resource=Resource.find(@resource_booking.resource_id)
    end
  end

  def resource_booking_approval
    if !params[:id].nil?
      @resource_room_booking = ResourceBooking.find(params[:id])
      @resource = SubCategory.find_by_id(@resource_booking.sub_category_id)
      @facility = Facility.active.find_all_by_resource_id(@resource_booking.resource_id)
      @details_resource = Resource.active.find_by_id(@resource_booking.resource_id)
      @user = User.find_by_id(@resource_booking.user_id)
      @dept = Department.find_by_id(default_department)
      @agencystore = AgencyStore.find_by_sub_category_id(@resource_booking.sub_category_id)
      if @agencystore.present?
        @agency= Agency.find_by_id(@agencystore.agency_id)
        @manager= User.find_by_id(@agency.user_id)
      end
    end
  end
 def update_resource_booking
    room = ResourceBooking.find_by_id(params[:resource_book_id])
    agency_store = AgencyStore.find_by_resource_id(params[:resource_id])
    if params[:resource_booking][:status] == "Returned" ||  params[:resource_booking][:status] == "Declined"
      agency_store.update_attribute(:booked, false)
    end
    @resource_booking = ResourceBooking.find_by_id(params[:resource_book_id])
    @resource_booking.update_attributes(params[:resource_booking])
    redirect_to(list_resource_booking_resource_bookings_path, :notice => 'Your Resource Booking Status has been successfully updated.')
  end
  def user_return
    room = ResourceBooking.find(params[:room_book_id])
    if params[:user_returned_status] == "true"
      room.update_attribute(:user_returned_status, true)
    else
      room.update_attribute(:user_returned_status, false)
    end
  end

 def get_other_sub_categories
    sub_categories= SubCategory.where("category_id =?",params[:category_id])
    render :json=>[sub_categories] if sub_categories
  end
  
  def get_resources
    if !params[:sub_category_id].nil?
      resoures = Resource.find_all_by_sub_category_id(params[:sub_category_id])
      render :json=>[resoures] if resoures
    end
  end
end
