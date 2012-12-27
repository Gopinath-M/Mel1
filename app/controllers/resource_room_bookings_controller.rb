class ResourceRoomBookingsController < ApplicationController
  before_filter :authenticate_user!
  #  before_filter :is_admin

  def index
    if current_user && session[:current_role] == DISP_USER_ROLE_SUPER_ADMIN
      @resource_room_bookings = ResourceRoomBooking.where(:user_id => 1).order.page(params[:page]).per(5)
    elsif current_user && current_user.is_resource_manager?
      @resource_room_bookings = ResourceRoomBooking.where(:user_id => current_user.id).order.page(params[:page]).per(5)
    else
      @resource_room_bookings = ResourceRoomBooking.where(:user_id => current_user.id).order.page(params[:page]).per(5)
    end
  end

  def new
    @resource_room_booking = ResourceRoomBooking.new()
    if session[:current_role] != DISP_USER_ROLE_SUPER_ADMIN
      @booking = CategoriesDepartments.where(:category_id=> "6", :department_id=> current_user.departments.first.id)
    end
  end

  def edit
    @resource_room_booking= ResourceRoomBooking.find(params[:id])
  end

  def show
    if !params[:id].nil?
      @resource_room_booking = ResourceRoomBooking.find(params[:id])
      @resource = SubCategory.find_by_id(@resource_room_booking.sub_category_id)
      @facility = Facility.active.find_all_by_resource_id(@resource_room_booking.resource_id)
      @details_resource = Resource.active.find_by_id(@resource_room_booking.resource_id)
      @user = User.find_by_id(@resource_room_booking.user_id)
      @dept = Department.find_by_id(@resource_room_booking.department_id)
      @agencystore = AgencyStore.find_by_sub_category_id(@resource_room_booking.sub_category_id)
      if @agencystore.present?
        @agency= Agency.find_by_id(@agencystore.agency_id)
        @manager= User.find_by_id(@agency.user_id)
      end
    end
  end

  def create
    #    p from_date = params[:resource_room_booking][:requested_from_date].to_datetime.to_s
    #    p to_date = params[:resource_room_booking][:requested_to_date].to_datetime.to_s
    agency = AgencyStore.find_by_resource_id(params[:resource_room_booking][:resource_id])
    if !agency.nil?
      if agency.booked == false
        @approve = Approver.active.find_all_by_department_id(current_user.departments).first
        @resource_room_booking = ResourceRoomBooking.create(params[:resource_room_booking])
        @resource_room_booking.agency_store_id = agency.id
        @resource_room_booking.user_id = params[:user_id]
        if session[:current_role] == DISP_USER_ROLE_SUPER_ADMIN
          @resource_room_booking.status = "Processed"
          @resource_room_booking.department_id = '0'
        elsif session[:current_role] == DISP_USER_ROLE_DEPT_ADMIN
          @resource_room_booking.status = "Approved"
          @resource_room_booking.department_id = params[:department_id]
        elsif current_user.id == @approve.user_id
          @resource_room_booking.status = "Approved"
          @resource_room_booking.department_id = params[:department_id]
        else
          @resource_room_booking.status = "New"
          @resource_room_booking.department_id = params[:department_id]
        end
        if @resource_room_booking.valid?
          @resource_room_booking.save
          agency.update_attribute(:booked, true)
          redirect_to(resource_room_bookings_path, :notice => "Your Room booking has been created sucessfully.")
        else
          if session[:current_role] != DISP_USER_ROLE_SUPER_ADMIN
            @booking = CategoriesDepartments.where(:category_id=> "6", :department_id=> current_user.departments.first.id)
            @approve = Approver.active.find_all_by_department_id(current_user.departments).first
            dept = Department.find_by_id(params[:department_id])
            if !@approve.present?
              user = dept.users.where("role_id = 2").first
              #UserMailer.send_mail_to_dept_admin_for_room_booking(user,@resource_room_booking,dept).deliver
            else
              user = User.find_by_id(@approve.user_id)
              #UserMailer.send_mail_to_approver_for_room_booking(user,@resource_room_booking,dept).deliver
            end
          end
          render :action => 'new'
        end
      else
        if current_user.is_super_admin?
          @room = ResourceRoomBooking.find_all_by_resource_id(params[:resource_room_booking][:resource_id], :conditions=>["user_id != ?", 1]).last
          @resource_room_booking = ResourceRoomBooking.create(params[:resource_room_booking])
          @resource_room_booking.agency_store_id = agency.id
          @resource_room_booking.status = "Processed"
          @resource_room_booking.user_id = params[:user_id]
          @resource_room_booking.department_id = '0'
          @resource_room_booking.save
          @room.update_attribute(:status, "Cancelled")
          redirect_to(resource_room_bookings_path, :notice => "Your Room booking has been created sucessfully.")
        else
          redirect_to(new_resource_room_booking_path, :alert => "You cant book the Already Reserved Room, Please try other.")
        end
      end
    else
      redirect_to(new_resource_room_booking_path, :alert => "Resource selected is not available in your Store.")
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
    facilities = Facility.active.find_all_by_resource_id(params[:resource_id])
    render :json=>[facilities] if facilities
  end

  def list_resource_booking
    if current_user.is_resource_manager?
      @booking = ResourceRoomBooking.where("department_id=? and status !=?", @current_department, "New").page(params[:page]).per(5)
    else
      @approve = Approver.active.find_all_by_department_id(current_user.departments).first
      @approver_second = Approver.active.find_all_by_department_id(current_user.departments).last
      if @approve.present?
        @booking = ResourceRoomBooking.where(:department_id => @approve.department_id).page(params[:page]).per(5)
        #          @booking = ResourceRoomBooking.find(:all, :conditions=>["department_id = ? and created_at >= ?",@approve.department_id,Time.now-seconds])
      elsif @approver_second.present?
        @booking = ResourceRoomBooking.where(:department_id => @approver_second.department_id).page(params[:page]).per(5)
      elsif session[:current_role] == DISP_USER_ROLE_SUPER_ADMIN
        @approve = Approver.active.find_all_by_department_id(current_user.departments).first
        @booking = ResourceRoomBooking.page(params[:page]).per(5)
        @second_approver = Approver.all.last
      else
        @booking = ResourceRoomBooking.where(:department_id => current_user.departments).order.page(params[:page]).per(5)
      end
    end
  end

  def update_room_booking
    @resource_room_booking = ResourceRoomBooking.find_by_id(params[:resource_book_id])
    agency_store = AgencyStore.find_by_resource_id(params[:resource_id])
    if params[:resource_room_booking][:status] == "Returned" ||  params[:resource_room_booking][:status] == "Declined"
      agency_store.update_attribute(:booked, false)
    end
    room = ResourceRoomBooking.find_by_id(params[:resource_book_id])
    room.update_attribute(:updated_by, params[:updated_by])
    @user = User.find(room.user_id)
    if @user.roles.first.name == "Resource Manager"
      room.update_attribute(:status, 'Processed')
    else
      room.update_attributes(params[:resource_room_booking])
    end
    ordered_user = User.find_by_id(room.user_id)
    resource_manager = RoleMembership.find_by_department_id(room.department_id, :conditions=>["role_id = ?", 5])
    if resource_manager.present?
      user = User.find_by_id(resource_manager.user_id)
      UserMailer.send_status_mail_ordered_user_for_room_booking(user,ordered_user,room).deliver
      UserMailer.send_status_mail_resource_manager_for_room_booking(user,ordered_user,room).deliver
    end
    redirect_to(list_resource_booking_resource_room_bookings_path, :notice => 'Your Room Booking Status has been successfully updated.')
  end

  def room_booking_approval
    if !params[:id].nil?
      @resource_room_booking = ResourceRoomBooking.find(params[:id])
      @resource = SubCategory.find_by_id(@resource_room_booking.sub_category_id)
      @facility = Facility.active.find_all_by_resource_id(@resource_room_booking.resource_id)
      @approve = Approver.find_all_by_department_id(current_user.departments).first
      @approve1 = Approver.find_all_by_department_id(current_user.departments).last
      @details_resource = Resource.active.find_by_id(@resource_room_booking.resource_id)
      @user = User.find_by_id(@resource_room_booking.user_id)
      @dept = Department.find_by_id(@resource_room_booking.department_id)
      @agencystore = AgencyStore.find_by_sub_category_id(@resource_room_booking.sub_category_id)
      if @agencystore.present?
        @agency= Agency.find_by_id(@agencystore.agency_id)
        @manager= User.find_by_id(@agency.user_id)
      end
    end
  end

  def user_return
    room = ResourceRoomBooking.find(params[:room_book_id])
    @user = User.find(room.user_id)
    if params[:user_returned_status] == "true" && room.user_id == 1
      room.update_attributes(:user_returned_status=>true, :status => "Returned")
      agency_store = AgencyStore.find_by_resource_id(room.resource_id)
      agency_store.update_attribute(:booked => false)
    elsif @user.roles.first.name == "Resource Manager"
      room.update_attributes(:user_returned_status=>true, :status => "Returned")
      agency_store = AgencyStore.find_by_resource_id(room.resource_id)
      agency_store.update_attribute(:booked => false)
    else
      room.update_attributes(:user_returned_status=>true)
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
    resources = Resource.find(params[:resource_id])
    render :json=>[resources] if resources
  end

  def download_attachments
    @message = ResourceRoomBooking.find(params[:id])
    send_file @message.room_attachment.path
  end

end
