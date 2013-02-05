class ResourceRoomBookingsController < ApplicationController
  before_filter :authenticate_user!
  #  before_filter :is_admin
  load_and_authorize_resource
  def index
    if session[:current_role] == DISP_USER_ROLE_SUPER_ADMIN
      @resource_room_bookings = ResourceRoomBooking.where(:user_id => current_user.id).order.page(params[:page]).per(5)
    else
      @resource_room_bookings = ResourceRoomBooking.where(:user_id => current_user.id, :department_id => @current_department).order.page(params[:page]).per(5)
    end
    category
  end

  def category
    if session[:current_role] != DISP_USER_ROLE_SUPER_ADMIN
      @category = Category.get_category("Room")
      @booking = CategoriesDepartments.where(:category_id => @category.first.id,:department_id => @current_department) if @category and !@category.empty?
    end
  end

  def new
    @resource_room_booking = ResourceRoomBooking.new
    category
  end

  def edit
    @resource_room_booking= ResourceRoomBooking.find(params[:id])
  end

  def show
    if !params[:id].nil?
      @resource_room_booking = ResourceRoomBooking.find(params[:id])
      @facility = Facility.active.find_all_by_resource_id(@resource_room_booking.resource_id)
      @user = User.find_by_id(@resource_room_booking.user_id)
      @agencystore = AgencyStore.find_by_sub_category_id(@resource_room_booking.sub_category_id)
      if @agencystore.present?
        @agency= Agency.find_by_id(@agencystore.agency_id)
        @manager= User.find_by_id(@agency.user_id)
      end
    end
  end

  def create
    category
    agency = AgencyStore.find_by_resource_id(params[:resource_room_booking][:resource_id])
    if !agency.nil?
      if agency.booked == false
        @approve = Approver.active.find_all_by_department_id(@current_department).first
        @resource_room_booking = ResourceRoomBooking.create(params[:resource_room_booking])
        @resource_room_booking.agency_store_id = agency.id
        @resource_room_booking.user_id = params[:user_id]
        if session[:current_role] == DISP_USER_ROLE_SUPER_ADMIN
          @resource_room_booking.status = "Processed"
          @resource_room_booking.department_id = '0'
        elsif session[:current_role] == DISP_USER_ROLE_DEPT_ADMIN
          @resource_room_booking.status = "Approved"
          @resource_room_booking.department_id = params[:department_id]
        elsif @approve  && current_user.id == @approve.user_id
          @resource_room_booking.status = "Approved"
          @resource_room_booking.department_id = params[:department_id]
        else
          @resource_room_booking.status = "New"
          @resource_room_booking.department_id = params[:department_id]
        end
        if @resource_room_booking.valid?
          @resource_room_booking.save
          agency.update_attribute(:booked, true)
          if session[:current_role] != DISP_USER_ROLE_SUPER_ADMIN
            @booking = CategoriesDepartments.where(:category_id=> "6", :department_id=> @current_department)
            @approve = Approver.active.find_all_by_department_id(@current_department).first
            dept = Department.find_by_id(params[:department_id])
            if !@approve.present?
              user = dept.users.where("role_id = 2").first
              UserMailer.send_mail_to_dept_admin_for_room_booking(user,@resource_room_booking,dept).deliver
            else
              user = User.find_by_id(@approve.user_id)
              UserMailer.send_mail_to_approver_for_room_booking(user,@resource_room_booking,dept).deliver
            end
          end
          ordered_user = User.find_by_id(@resource_room_booking.user_id)
          UserMailer.send_mail_to_user_for_room_booking(ordered_user,@resource_room_booking,dept).deliver
          redirect_to(resource_room_bookings_path, :notice => "Your Room booking has been created sucessfully.")
        else
          render :action => 'new'
        end
      else
        redirect_to(new_resource_room_booking_path, :alert => "You cant book the Already Reserved Room, Please try other.")
      end
    elsif session[:current_role] == DISP_USER_ROLE_SUPER_ADMIN
      val = AgencyStore.find_by_resource_id(params[:room][:type_id_booked])
      @resource_room_booking = ResourceRoomBooking.create(params[:resource_room_booking])
      if @resource_room_booking.valid?
        @room = ResourceRoomBooking.find_all_by_resource_id(params[:room][:type_id_booked], :conditions=>["(status = 'New' or status = 'Approved') and agency_store_id=#{val.id} and user_id != ?", 1]).last
        if @room.present?
          @room.update_attribute(:status, "Cancelled")
          @resource_room_booking.resource_id = params[:room][:type_id_booked]
          @resource_room_booking.agency_store_id = val.id
          @resource_room_booking.status = "Processed"
          @resource_room_booking.user_id = params[:user_id]
          @resource_room_booking.department_id = '0'
          @resource_room_booking.save
          redirect_to(resource_room_bookings_path, :notice => "Your Room booking has been created sucessfully.")
        else
          redirect_to(new_resource_room_booking_path, :alert => "You can't book the Room which is already Processed.")
        end
      else
        render :action => 'new'
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
    if session[:current_role] == DISP_USER_ROLE_RESOURCE_MANAGER
      #@booking = ResourceRoomBooking.where("department_id=? and status !=?", @current_department, "New").page(params[:page]).per(5)
      agency = Department.find(@current_department).agency
      depts = agency.departments.collect(&:id).join(',')
      @booking = ResourceRoomBooking.where("department_id in (#{depts}) and status !=?", "New").page(params[:page]).per(5)
    else
      @approve = Approver.active.find_all_by_department_id(@current_department).first
      @approver_second = Approver.active.find_all_by_department_id(@current_department).last
      if @approve.present?
        @booking = ResourceRoomBooking.where(:department_id => @approve.department_id).page(params[:page]).per(5)
        #          @booking = ResourceRoomBooking.find(:all, :conditions=>["department_id = ? and created_at >= ?",@approve.department_id,Time.now-seconds])
      elsif @approver_second.present?
        @booking = ResourceRoomBooking.where(:department_id => @approver_second.department_id).page(params[:page]).per(5)
      elsif session[:current_role] == DISP_USER_ROLE_DEPT_ADMIN
        @approver_second = Approver.active.find_all_by_department_id(@current_department).last
        @booking = ResourceRoomBooking.where(:department_id => @current_department).order.page(params[:page]).per(5)
      end
    end
  end

  def update_room_booking
    @resource_room_booking = ResourceRoomBooking.find_by_id(params[:resource_book_id])
    agency_store = AgencyStore.find_by_resource_id(params[:resource_id])
    room = ResourceRoomBooking.find_by_id(params[:resource_book_id])
    room.update_attribute(:updated_by, params[:updated_by])
    if params[:resource_room_booking][:status] == "Returned" ||  params[:resource_room_booking][:status] == "Declined"
      agency_store.update_attribute(:booked, false)
    end
    if room.status == "Approved"
      if params[:change_room] == "true" && params[:resource_val][:id] != ""
        agency_store = AgencyStore.find_by_resource_id(room.resource_id)
        agency_store.update_attribute(:booked, false)
        store = AgencyStore.find_by_resource_id(params[:resource_val][:id])
        store.update_attribute(:booked, true)
        room.update_attribute(:resource_id, params[:resource_val][:id])
        room.update_attribute(:agency_store_id, store.id)
      end
    end
    @user = User.find(room.user_id)
    if @user.roles.first.name == "Resource Manager"
      room.update_attribute(:status, 'Processed')
    else
      room.update_attributes(params[:resource_room_booking])
    end
    ordered_user = User.find_by_id(room.user_id)
    agency = Agency.find(room.agency_store.agency_id)
    if !agency.user_id.nil?
      UserMailer.send_status_mail_ordered_user_for_room_booking(agency.user,ordered_user,room).deliver
      UserMailer.send_status_mail_resource_manager_for_room_booking(agency.user,ordered_user,room).deliver
    end
    redirect_to(list_resource_booking_resource_room_bookings_path, :notice => 'Your Room Booking Status has been successfully updated.')
  end

  def room_booking_approval
    if !params[:id].nil?
      @resource_room_booking = ResourceRoomBooking.find(params[:id])
      @resource = SubCategory.find_by_id(@resource_room_booking.sub_category_id)
      @facility = Facility.active.find_all_by_resource_id(@resource_room_booking.resource_id)
      @approve = Approver.find_all_by_department_id(@current_department).first
      @approve1 = Approver.find_all_by_department_id(@current_department).last
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
      agency_store.update_attribute(:booked,false)
    elsif @user.roles.first.name == "Resource Manager"
      room.update_attributes(:user_returned_status=>true, :status => "Returned")
      agency_store = AgencyStore.find_by_resource_id(room.resource_id)
      agency_store.update_attribute(:booked,false)
    else
      room.update_attributes(:user_returned_status=>true)
    end
  end

  def get_resources
    brands = {}
    if !params[:sub_category_id].nil?
      val = SubCategory.find(params[:sub_category_id])
      @category = Category.get_category("Transportation")
      if val.category_id == @category.first.id
        resources = Resource.find_all_by_sub_category_id_and_alloted(params[:sub_category_id],false)
        resources.each do |resource|
          brand = VehicleModelType.find(resource.vehicle_model_type_id)
          val= brand.name.to_s + " : " + resource.vehicle_model.to_s + " : " + resource.resource_no.to_s
          brands.store(resource.id,val)
        end
        render :json=>[brands] if brands
      else
        resoures = Resource.active.find_all_by_sub_category_id_and_alloted(params[:sub_category_id],false)
        render :json=>[resoures] if resoures
      end
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

  def get_booked_rooms
    if current_user.is_super_admin?
      booked_rooms = Resource.find_by_sql "SELECT * FROM resources INNER JOIN agency_stores ON resources.id = agency_stores.resource_id
                                            WHERE agency_stores.booked = true
                                            AND resources.sub_category_id =#{params[:sub_category_id]}"
      available_rooms = Resource.find_by_sql "SELECT * FROM resources INNER JOIN agency_stores ON resources.id = agency_stores.resource_id
                                               WHERE agency_stores.booked = false AND
                                               resources.sub_category_id=#{params[:sub_category_id]}"

      render :json =>{ :booked => booked_rooms, :available => available_rooms}
    end
  end

  def list_room_booking
    if params[:ic_number].present?
      users = User.find_by_ic_number(params[:ic_number])
      @resource_room_bookings = ResourceRoomBooking.where(:user_id => users.id).order.page(params[:page]).per(5)
    else
      @resource_room_bookings = ResourceRoomBooking.order.page(params[:page]).per(5)
    end
    if request.xhr?
      render :layout=>false
    end
  end

end
