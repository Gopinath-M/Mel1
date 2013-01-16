class ResourceIctEquipmentBookingsController < ApplicationController
  before_filter :authenticate_user!

  def index
    if session[:current_role] == DISP_USER_ROLE_SUPER_ADMIN
      @resource_ict_equipment_bookings=ResourceIctEquipmentBooking.where(:user_id=>current_user.id).order.page(params[:page]).per(10)
    else
      @resource_ict_equipment_bookings = ResourceIctEquipmentBooking.where(:user_id => current_user.id, :department_id=>@current_department).order.page(params[:page]).per(10)
    end
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
    @resource=params[:resource_ict_equipment_booking][:resource_id]
    department_id = (session[:current_role] == DISP_USER_ROLE_SUPER_ADMIN) ? 0 : @current_department
    dept = Department.find(@current_department) if session[:current_role] != DISP_USER_ROLE_SUPER_ADMIN
    create_flag = false
    quantifiable = false
    if !params[:resource_ict_equipment_booking][:agency_store_id].blank?
      agency_store = AgencyStore.find(params[:resource_ict_equipment_booking][:agency_store_id])
      if agency_store.booked == false
        create_flag = true
      end
    else
      if session[:current_role] != DISP_USER_ROLE_SUPER_ADMIN
        agency_store = AgencyStore.where(:resource_id => params[:resource_ict_equipment_booking][:resource_id], :sub_category_id => params[:resource_ict_equipment_booking][:sub_category_id], :agency_id => dept.agency_id).first
      else
        agency_store = AgencyStore.where(:resource_id => params[:resource_ict_equipment_booking][:resource_id], :sub_category_id => params[:resource_ict_equipment_booking][:sub_category_id]).first
      end

      if agency_store && agency_store.quantity != agency_store.booked_quantity && agency_store.quantity > agency_store.booked_quantity
        create_flag = true
        quantifiable = true
      end
    end
    if agency_store.nil?
      @resource_ict_equipment_booking = ResourceIctEquipmentBooking.new(params[:resource_ict_equipment_booking].merge!({:department_id => department_id,:user_id => current_user.id}))
    else
      @resource_ict_equipment_booking = ResourceIctEquipmentBooking.new(params[:resource_ict_equipment_booking].merge!({:department_id => department_id,:user_id => current_user.id, :agency_store_id => agency_store.id}))
    end
    if create_flag
      @resource_ict_equipment_booking.status = (session[:current_role] == DISP_USER_ROLE_SUPER_ADMIN) ? "Processed" : ((session[:current_role] == DISP_USER_ROLE_DEPT_ADMIN) ? "Approved" : "New")
      if @resource_ict_equipment_booking.valid?
        @resource_ict_equipment_booking.save
        #        if session[:current_role] != DISP_USER_ROLE_SUPER_ADMIN && session[:current_role] != DISP_USER_ROLE_DEPT_ADMIN
        #          first_approver = Approver.active.where(:department_id => @current_department).first
        #          if !first_approver.present?
        #            user = dept.users.where("role_id = 2").first
        #            UserMailer.send_mail_to_dept_admin_for_ict_equipment_booking(user,@resource_ict_equipment_booking,dept).deliver
        #          else
        #            UserMailer.send_mail_to_approver_for_ict_equipment_booking(first_approver.user,@resource_ict_equipment_booking, dept).deliver
        #          end
        #        end
        if !quantifiable
          agency_store.update_attribute(:booked, true)
        else
          if (agency_store.quantity - agency_store.booked_quantity) > 1
            agency_store.update_attribute(:booked_quantity, agency_store.booked_quantity+1)
          else
            agency_store.update_attributes(:booked_quantity => agency_store.booked_quantity+1, :booked => true)
          end
        end
        redirect_to resource_ict_equipment_bookings_path, :notice => "Your ICT Equipment booking has been created sucessfully."
      else
        render :action=>'new'
      end
    else
      render :action=>'new' , :alert => "You can't book already booked ICT Equipment, Please try other."
    end
    #  else
    #    render :action => 'new' , :alert => "Resource selected is not available in your Store."
    #  end
  end

  #  def approval_details(ict_equipment)
  #    @resource = SubCategory.find(ict_equipment.sub_category_id) if ict_equipment
  #  end
  
  def show
    @resource_ict_equipment_booking = ResourceIctEquipmentBooking.find(params[:id]) if params[:id]
    #    approval_details(@resource_ict_equipment_booking)
  end

  def requests
    if current_user.is_resource_manager?
      @booking = ResourceIctEquipmentBooking.where(" department_id = ?  and status !='New' ",@current_department).page(params[:page]).per(10)
    else
      @approve = Approver.active.find_all_by_department_id(@current_department).first
      @approver_second = Approver.active.find_all_by_department_id(@current_department).last
      if @approve.present?
        @booking = ResourceIctEquipmentBooking.where(:department_id => @approve.department_id).page(params[:page]).per(10)
      elsif @approver_second.present?
        @booking = ResourceIctEquipmentBooking.where(:department_id => @approver_second.department_id).page(params[:page]).per(10)
      else
        @booking = ResourceIctEquipmentBooking.where(:department_id => @current_department).order.page(params[:page]).per(10)
      end
    end
  end

  def approve_request
    @resource_ict_equipment_booking = ResourceIctEquipmentBooking.find(params[:id]) if params[:id]
    #    approval_details(@resource_ict_equipment_booking)
  end
  
  def update_booking
    @resource_ict_equipment_booking = ResourceIctEquipmentBooking.find(params[:id])
    if @resource_ict_equipment_booking
      agency_store = @resource_ict_equipment_booking.agency_store
      agency_store.update_attribute(:booked, false) if (params[:resource_ict_equipment_booking][:status] == "Returned" ||  params[:resource_ict_equipment_booking][:status] == "Declined")
      status = params[:resource_ict_equipment_booking][:status].downcase
      params[:resource_ict_equipment_booking]["#{status}_date"] = Time.now
      if params[:resource_ict_equipment_booking][:status] == "Returned"
        if @resource_ict_equipment_booking.agency_store.quantity > 1
          @resource_ict_equipment_booking.agency_store.update_attributes(:booked => false, :booked_quantity => @resource_ict_equipment_booking.agency_store.booked_quantity-1)
        else
          @resource_ict_equipment_booking.agency_store.update_attribute(:booked , false)
        end
      end
      if @resource_ict_equipment_booking.update_attributes(params[:resource_ict_equipment_booking].merge!({:approver_id => current_user.id}))
        agency = Agency.find(@resource_ict_equipment_booking.agency_store.agency_id)
        if !agency.user_id.nil?
          UserMailer.send_status_mail_for_ict_equipment_booking(agency.user, @resource_ict_equipment_booking.user, @resource_ict_equipment_booking).deliver #if agency && agency.user  #if resource_manager && resource_manager.user && !resource_manager.user.blank?
        end
        #        resource_manager = RoleMembership.find_by_user_id_and_role_id(agency.user_id, 05)
        #UserMailer.send_status_mail_for_ict_equipment_booking(resource_manager.user,@resource_ict_equipment_booking.user,@resource_ict_equipment_booking).deliver if resource_manager && resource_manager.user && !resource_manager.user.blank?
        redirect_to(requests_resource_ict_equipment_bookings_path, :notice => 'Your ICT Equipment Status has been successfully updated.')
      else
        approval_details(@resource_ict_equipment_booking)
        render :action=>'approve_request', :id => params[:id]
      end
    end
  end

  def download_attachments
    @message = ResourceIctEquipmentBooking.find(params[:id])
    send_file @message.ict_equipment_attachment.path
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
