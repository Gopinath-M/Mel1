class ResourceIctEquipmentBookingsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @resource_ict_equipment_bookings=ResourceIctEquipmentBooking.order.page(params[:page]).per(10)
  end
  
  def category
    @category=Category.get_category("ICT Equipment")
    @category_department = CategoriesDepartments.where(:category_id=>@category.first.id,:department_id=> @current_department) if @category and !@category.empty?
  end

  def new
    category
    @resource_ict_equipment_booking = ResourceIctEquipmentBooking.new
  end

  def create
    category
    agency = AgencyStore.find(params[:resource_ict_equipment_booking][:agency_store_id]) if params[:resource_ict_equipment_booking] && !params[:resource_ict_equipment_booking][:agency_store_id].blank?
    if !agency.nil?
      if agency.booked == false
        @resource=params[:resource_ict_equipment][:resource_id]
        @resource_ict_equipment_booking = ResourceIctEquipmentBooking.create(params[:resource_ict_equipment_booking].merge!({:department_id=>@current_department,:user_id=>current_user.id}))
        if @resource_ict_equipment_booking.valid?
          @resource_ict_equipment_booking.save
          agency.update_attribute(:booked, true)
          redirect_to resource_ict_equipment_bookings_path, :notice => "Your ICT Equipment booking has been created sucessfully."
        else
          render :action=>'new'
        end
      else
        redirect_to(new_resource_ict_equipment_booking_path, :alert => "You can't book already booked ICT Equipment, Please try other.")
      end
    else
      redirect_to(new_resource_ict_equipment_booking_path, :alert => "Resource selected is not available in your Store.")
    end
  end
  
  def show
    @resource_ict_equipment_booking = ResourceIctEquipmentBooking.find(params[:id]) if params[:id]
    @resource = SubCategory.find_by_id(@resource_ict_equipment_booking.sub_category_id) if @resource_ict_equipment_booking
    @dept = Department.find_by_id(default_department)
    @manager= User.find_by_id(@resource_ict_equipment_booking.agency_store.agency.user_id) if @resource_ict_equipment_booking.agency_store && @resource_ict_equipment_booking.agency_store.agency
    @details_resource = Resource.active.find_by_id(@resource_ict_equipment_booking.agency_store.resource_id)
  end


  def requests
    if current_user.is_resource_manager?
      @booking = ResourceIctEquipmentBooking.find_all_by_department_id(@current_department, :conditions => ["status != 'New'"])
    else
      @approve = Approver.active.find_all_by_department_id(@current_department).first
      @approver_second = Approver.active.find_all_by_department_id(@current_department).last
      if @approve.present?
        @booking = ResourceIctEquipmentBooking.find_all_by_department_id(@approve.department_id)
      elsif @approver_second.present?
        @booking = ResourceIctEquipmentBooking.where(:department_id => @approver_second.department_id)
      else
        @booking = ResourceIctEquipmentBooking.where(:department_id => @current_department).order.page(params[:page]).per(5)
      end
    end
  end

  def approve_request
    @resource_ict_equipment_booking = ResourceIctEquipmentBooking.find(params[:id]) if params[:id]
    @resource = SubCategory.find_by_id(@resource_ict_equipment_booking.sub_category_id) if @resource_ict_equipment_booking
    @dept = Department.find_by_id(default_department)
    @manager= User.find_by_id(@resource_ict_equipment_booking.agency_store.agency.user_id) if @resource_ict_equipment_booking.agency_store && @resource_ict_equipment_booking.agency_store.agency
    @details_resource = Resource.active.find_by_id(@resource_ict_equipment_booking.agency_store.resource_id)
  end
  
  def update_booking
    @resource_ict_equipment_booking = ResourceIctEquipmentBooking.find(params[:id])
    if @resource_ict_equipment_booking
      agency_store =@resource_ict_equipment_booking.agency_store
      if params[:resource_ict_equipment_booking][:status] == "Returned" ||  params[:resource_ict_equipment_booking][:status] == "Declined"
        agency_store.update_attribute(:booked, false)
      end
      status=params[:resource_ict_equipment_booking][:status].downcase
      params[:resource_ict_equipment_booking]["#{status}_date"]=Time.now
      if @resource_ict_equipment_booking.update_attributes(params[:resource_ict_equipment_booking].merge!({:approver_id=>current_user.id}))
        redirect_to(requests_resource_ict_equipment_bookings_path, :notice => 'Your ICT Equipment Status has been successfully updated.')
      else
        @resource = SubCategory.find_by_id(@resource_ict_equipment_booking.sub_category_id) if @resource_ict_equipment_booking
        @dept = Department.find_by_id(default_department)
        @manager= User.find_by_id(@resource_ict_equipment_booking.agency_store.agency.user_id) if @resource_ict_equipment_booking.agency_store && @resource_ict_equipment_booking.agency_store.agency
        @details_resource = Resource.active.find_by_id(@resource_ict_equipment_booking.agency_store.resource_id)
        render :action=>'approve_request', :id=>params[:id]
      end
    end
  end

  def user_return
    ict_equipment = ResourceIctEquipmentBooking.find(params[:ict_equipment_id])
    if params[:user_returned_status] == "true"
      if ict_equipment.update_attributes(:user_returned_status=> true, :returned_date=>Time.now)
        render :json=>["Success"]
      else
        render :json=>["Error"]
      end
    end
  end
end
