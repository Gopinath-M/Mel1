class ResourceBookingsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  def new
    @resource_booking=ResourceBooking.new
    category
  end

  def category
    if session[:current_role] != DISP_USER_ROLE_SUPER_ADMIN
      @category = Category.get_list_category("Room", "Transporation", "ICT Equipment")
      args = ["6", "7", "8"]
      @booking = CategoriesDepartments.find(:all, :conditions=>["department_id=#{@current_department} and category_id not in (?)", [args[0],args[1],args[2]]])
    end
  end


  def create
    category
    agency = AgencyStore.find_by_resource_id(params[:resource_booking][:resource_id])
    if !agency.nil?
      if agency.booked == false
        @resource_booking=ResourceBooking.new(params[:resource_booking])
        @resource_booking.category_id = params[:other_booking_category_id]
        @resource_booking.sub_category_id = params[:other_booking_sub_category][:id]
        @resource_booking.department_id = params[:department_id]
        @resource_booking.user_id=current_user.id
        @resource_booking.agency_store_id = agency.id
        @resource_booking.created_by = current_user.id
        if current_user.is_department_admin?
          @resource_booking.approved_date = Time.now
          @resource_booking.status = "Approved"
        elsif current_user.is_super_admin?
          @resource_booking.priority_booking = true
          @resource_booking.processed_date = Time.now
          @resource_booking.status = "Processed"
        else
          @resource_booking.status = "New"
        end
        if @resource_booking.valid?
          agency.update_attribute(:booked, true)
          @resource_booking.save
          #          if current_user.is_department_admin? && current_user.is_super_admin?
          @approve = Approver.active.find_all_by_department_id(current_user.departments).first
          dept = Department.find_by_id(params[:department_id])
          if !@approve.present? && !current_user.is_super_admin?
            user = dept.users.where("role_id = 2").first
            UserMailer.send_mail_to_dept_admin_for_others_booking(user,@resource_booking,dept).deliver
          else
            user = User.find_by_id(@approve.user_id)
            UserMailer.send_mail_to_approver_others_for_booking(user,@resource_booking,dept).deliver
          end
          #          end
          redirect_to(resource_bookings_path, :notice => "Resource booking has been created sucessfully.")
        else
          render :action=>'new'
        end
      else
        redirect_to(new_resource_booking_path, :alert => "You cant book the Already Reserved Resource, Please try other.")
      end
    elsif session[:current_role] == DISP_USER_ROLE_SUPER_ADMIN
      val = AgencyStore.find_by_resource_id(params[:other][:type_id_booked])
      @resource_booking = ResourceBooking.new(params[:resource_booking])
      if @resource_booking.valid?
        @other = ResourceBooking.find_all_by_resource_id(params[:other][:type_id_booked], :conditions=>["(status = 'New' or status = 'Approved') and agency_store_id=#{val.id} and user_id != ?", 1]).last
        if @other.present?
          @other.update_attribute(:status, "Cancelled")
          @resource_booking.category_id = params[:other_booking_category_id]
          @resource_booking.sub_category_id = params[:other_booking_sub_category][:id]
          @resource_booking.resource_id = params[:other][:type_id_booked]
          @resource_booking.agency_store_id = val.id
          @resource_booking.status = "Processed"
          @resource_booking.user_id = params[:user_id]
          @resource_booking.department_id = '0'
          @resource_booking.save
          redirect_to(resource_bookings_path, :notice => "Resource Booking has been created sucessfully.")
        else
          redirect_to(new_resource_booking_path, :alert => "You can't book the Resource which is already Processed.")
        end
      else
        render :action => 'new'
      end
    else
      redirect_to(new_resource_booking_path, :alert => "Resource selected is not available in your Store.")
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
    category
    if current_user && current_user.is_super_admin?
      @resource_bookings = ResourceBooking.order.page(params[:page]).per(5)
    elsif current_user && current_user.is_resource_manager?
      @resource_bookings = ResourceBooking.where(:status => 'Approved').order.page(params[:page]).per(5)
    else
      @resource_bookings = ResourceBooking.where(:user_id => current_user.id).order.page(params[:page]).per(5)
    end
  end

  def show
    if !params[:id].nil?
      @resource_booking = ResourceBooking.find(params[:id])
      @resource = SubCategory.find_by_id(@resource_booking.sub_category_id)
      @facility = Facility.active.find_all_by_resource_id(@resource_booking.resource_id)
      @details_resource = Resource.active.find_by_id(@resource_booking.resource_id)
      @user = User.find_by_id(@resource_booking.user_id)
      if !current_user.is_super_admin?
        @dept = Department.find_by_id(default_department)
      end
      @agencystore = AgencyStore.find_by_sub_category_id(@resource_booking.sub_category_id)
      if @agencystore.present?
        @agency= Agency.find_by_id(@agencystore.agency_id)
        @manager= User.find_by_id(@agency.user_id)
      end
    end
  end

  def list_resource_booking
    if current_user.is_resource_manager?
      #@booking = ResourceBooking.find_all_by_department_id(current_user.departments, :conditions => ["status != 'New'"])
      agency = Department.find(@current_department).agency
      depts = agency.departments.collect(&:id).join(',')
      @booking = ResourceBooking.where("department_id in (#{depts}) and status !=?", "New").page(params[:page]).per(5)     
    else
      @approve = Approver.active.find_all_by_department_id(current_user.departments).first
      @approver_second = Approver.active.find_all_by_department_id(current_user.departments).last
      if @approve.present?
        #@booking = ResourceBooking.find_all_by_department_id(@approve.department_id)
        @booking = ResourceBooking.where(:department_id => @approve.department_id).order.page(params[:page]).per(5)
      elsif @approver_second.present?
        @booking = ResourceBooking.where(:department_id => @approver_second.department_id)
      else
        @booking = ResourceBooking.where(:department_id => current_user.departments).order.page(params[:page]).per(5)
      end
    end
  end

  def resource_booking_approval
    if !params[:id].nil?
      @resource_booking = ResourceBooking.find(params[:id])
      @resource = SubCategory.find_by_id(@resource_booking.sub_category_id)
      @facility = Facility.active.find_all_by_resource_id(@resource_booking.resource_id)
      @details_resource = Resource.active.find_by_id(@resource_booking.resource_id)
      @user = User.find_by_id(@resource_booking.user_id)
      if !current_user.is_super_admin?
        @dept = Department.find_by_id(default_department)
      end
      @agencystore = AgencyStore.find_by_sub_category_id(@resource_booking.sub_category_id)
      if @agencystore.present?
        @agency= Agency.find_by_id(@agencystore.agency_id)
        @manager= User.find_by_id(@agency.user_id)
      end
    end
    if current_user.is_resource_manager?
      @booking = ResourceBooking.find_all_by_department_id(current_user.departments, :conditions => ["status != 'New'"])
    else
      @approve = Approver.active.find_all_by_department_id(current_user.departments).first
      @approver_second = Approver.active.find_all_by_department_id(current_user.departments).last
      if @approve.present?
        @booking = ResourceBooking.find_all_by_department_id(@approve.department_id)
      elsif @approver_second.present?
        @booking = ResourceBooking.where(:department_id => @approver_second.department_id)
      else
        @booking = ResourceBooking.where(:department_id => current_user.departments).order.page(params[:page]).per(5)
      end
    end
  end
  
  def update_resource_booking
    others = ResourceBooking.find_by_id(params[:resource_book_id])
    agency_store = AgencyStore.find_by_resource_id(params[:resource_id])
    if params[:resource_booking][:status] == "Returned" ||  params[:resource_booking][:status] == "Declined"
      agency_store.update_attribute(:booked, false)
    end
    if others.status == "Approved"
      agency_store = AgencyStore.find_by_resource_id(params[:resource_id])
      agency_store.update_attribute(:booked, false)
      store = AgencyStore.find_by_resource_id(params[:resource_booking][:resource_id])
      store.update_attribute(:booked, true)
      others.update_attribute(:agency_store_id, store.id)
    end
    @resource_booking = ResourceBooking.find_by_id(params[:resource_book_id])
    @resource_booking.update_attributes(params[:resource_booking])
    @resource_booking.update_attribute(:updated_by, current_user.id)
    ordered_user = User.find_by_id(others.user_id)
    resource_manager = RoleMembership.find_by_department_id(others.department_id, :conditions=>["role_id = ?", 5])
    if resource_manager.present?
      user = User.find_by_id(resource_manager.user_id)
      UserMailer.send_status_mail_for_others_booking(user,ordered_user,others).deliver
    end
    redirect_to(list_resource_booking_resource_bookings_path, :notice => 'Your Resource Booking Status has been successfully updated.')
  end
  
  def user_return
    others = ResourceBooking.find(params[:room_book_id])
    @user = User.find(others.user_id)
    if params[:user_returned_status] == "true" && others.user_id == 1
      p others.update_attributes(:user_returned_status => true, :status => "Returned")
      agency_store = AgencyStore.find_by_resource_id(others.resource_id)
      p agency_store.update_attribute(:booked,false)
    elsif @user.roles.first.name == "Resource Manager"
      others.update_attributes(:user_returned_status=>true, :status => "Returned")
      agency_store = AgencyStore.find_by_resource_id(others.resource_id)
      agency_store.update_attribute(:booked,false)
    else
      others.update_attribute(:user_returned_status, true)
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

  def download_attachments
    @download = ResourceBooking.find(params[:id])
    send_file @download.attachment.path
  end

  def get_list_of_facility
    facilities = Facility.active.find_all_by_resource_id(params[:resource_id])
    render :json=>[facilities] if facilities
  end
  
  def get_details_for_resource
    resources = Resource.find(params[:resource_id])
    render :json=>[resources] if resources
  end

  def get_booked
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

  def list_others_booking
    if params[:ic_number].present?
      users = User.find_by_ic_number(params[:ic_number])
      p @resource_bookings = ResourceBooking.where(:user_id => users.id).order.page(params[:page]).per(5)
    else
      @resource_bookings = ResourceBooking.order.page(params[:page]).per(5)
    end
    if request.xhr?
      render :layout=>false
    end
  end

 def cancel_other_request
      cancel_request = ResourceBooking.find(params[:resource_book_id])
      cancel_request.update_attribute(:status, "Cancelled")
      redirect_to(resource_bookings_path, :notice => "Your Other booking has been cancelled sucessfully.")
  end

end
