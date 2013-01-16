class ResourceTransportationBookingsController < ApplicationController
  before_filter :authenticate_user!
  include ResourceTransportationBookingsHelper
  def index
    #approve_request
    @resource_transportation_bookings = ResourceTransportationBooking.where(:requester_id => "#{current_user.id}").order.page(params[:page]).per(5)
  end

  def new
    @resource_transportation_booking = ResourceTransportationBooking.new
    if !current_user.is_super_admin?
      @category = CategoriesDepartments.where(:category_id => 7,:department_id => @current_department)
      @sub_category = SubCategory.where(:category_id => 7,:is_available => true )
    end
  #@if_inside_agency = AgencyStore.where(:category_id=> 7,:booked=> false,:agency_id => current_user.departments.collect(&:agency_id).join(','))
  end

  def get_vehicle_brands
    vehicle_brands =params[:sub_category_id] ? VehicleModelType.active.where("sub_category_id =?",params[:sub_category_id]) : nil
    render :json=>[vehicle_brands] if vehicle_brands
  end

  def get_booked_and_available_vehicles
    if current_user.is_super_admin?
      booked_vehicles = Resource.find_by_sql "SELECT * FROM resources INNER JOIN agency_stores ON resources.id = agency_stores.resource_id
                                            WHERE agency_stores.booked = true
                                            AND resources.vehicle_model_type_id =#{params[:vehicle_model_type_id]}"

      available_vehicles = Resource.find_by_sql "SELECT * FROM resources INNER JOIN agency_stores ON resources.id = agency_stores.resource_id
                                               WHERE agency_stores.booked = false AND
                                               resources.vehicle_model_type_id=#{params[:vehicle_model_type_id]}"
      render :json =>{ :booked => booked_vehicles, :available => available_vehicles}
    else
      agency = get_current_agency
      available_vehicles = Resource.find_by_sql "SELECT * FROM resources INNER JOIN agency_stores ON resources.id = agency_stores.resource_id
                                               WHERE agency_stores.booked = false
                                               AND agency_stores.agency_id =#{agency}
                                               AND resources.vehicle_model_type_id=#{params[:vehicle_model_type_id]}"
      render :json =>{ :available => available_vehicles}
    end
  end
  
  def get_current_agency
    dept = Department.find(@current_department)
    agency = dept.agency.id
    return agency
  end

  def get_other_agency_vehicles
    vehicles ={}
    agency = get_current_agency
    available_vehicles = Resource.find_by_sql "SELECT * FROM resources INNER JOIN agency_stores ON resources.id = agency_stores.resource_id
                                               WHERE agency_stores.booked = false
                                               AND agency_stores.agency_id != #{agency}
                                               AND resources.vehicle_model_type_id=#{params[:vehicle_model_type_id]}"

    available_vehicles.each do |resource|
      ag = AgencyStore.find_by_resource_id(resource.resource_id)
      val= resource.vehicle_model.to_s + " : " + resource.resource_no.to_s + " : " + ag.agency.name.to_s
      vehicles.store(resource.resource_id, val)
    end
    render :json=>[vehicles] if vehicles

  # render :json =>{ :available => available_vehicles}
  end

  def get_vehicles
    agency = get_current_agency
    vehicles = Resource.find_by_sql "SELECT * FROM resources INNER JOIN agency_stores ON resources.id = agency_stores.resource_id
                                     WHERE agency_stores.booked = false
                                     AND agency_stores.agency_id =#{agency}
                                     AND resources.vehicle_model_type_id =#{params[:vehicle_model_type_id]}"

    render :json=>[vehicles] if vehicles
  end

  def create
    @resource_transportation_booking = ResourceTransportationBooking.new(params[:resource_transportation_booking])

    if @resource_transportation_booking.valid?

      if (session[:current_role] != DISP_USER_ROLE_SUPER_ADMIN || session[:current_role] != DISP_USER_ROLE_RESOURCE_MANAGER)
        @approver = Approver.active.find_all_by_department_id(@current_department).first
        @approve_second = Approver.active.find_all_by_department_id(@current_department).last
      end

      if current_user.is_super_admin?

        if params[:vehicle][:model_type_id_available] != ''
          agency_store = AgencyStore.find_by_resource_id(params[:vehicle][:model_type_id_available])
          @resource_transportation_booking.agency_store_id = agency_store.id
          @resource_transportation_booking.driver_id = agency_store.driver_id
          @resource_transportation_booking.status = "Processed"
          @resource_transportation_booking.department_id = '0'
          @resource_transportation_booking.requester_id = current_user.id
          @resource_transportation_booking.requested_from_date = (params[:resource_transportation_booking][:requested_from_date]).to_datetime
          @resource_transportation_booking.requested_to_date = (params[:resource_transportation_booking][:requested_to_date]).to_datetime
          agency_store.update_attributes(:booked=>true)
          @resource_transportation_booking.save
          redirect_to(resource_transportation_bookings_path, :notice => "Your Transport booking has been created sucessfully.")
        else
          agency_store = AgencyStore.find_by_resource_id(params[:vehicle][:model_type_id_booked])
          rtb_old = ResourceTransportationBooking.find(:first,:conditions=>["(status = 'New' or status = 'Approved') and agency_store_id=#{agency_store.id}"])
          #rtb_old = ResourceTransportationBooking.where("agency_store_id = #{agency_store.id} and (status='New' or status='Approved'")
          if rtb_old.present?
            rtb_old.update_attribute(:status,"Cancelled")
            @resource_transportation_booking.agency_store_id = rtb_old.agency_store_id
            @resource_transportation_booking.driver_id = rtb_old.driver_id
            @resource_transportation_booking.status = "Processed"
            @resource_transportation_booking.department_id = '0'
            @resource_transportation_booking.requester_id = current_user.id
            @resource_transportation_booking.requested_from_date = (params[:resource_transportation_booking][:requested_from_date]).to_datetime
            @resource_transportation_booking.requested_to_date = (params[:resource_transportation_booking][:requested_to_date]).to_datetime
            @resource_transportation_booking.save
            agency_store.update_attributes(:booked=>true)
            redirect_to(resource_transportation_bookings_path, :notice => "Your Transport booking has been created sucessfully.")
          else
            redirect_to(new_resource_transportation_booking_path, :alert => "You can't book the Vehicle which is already Processed.")
          end
        end
      elsif (current_user.is_department_admin? || (@approver.present? and @approver.user_id.to_i == current_user.id) || (@approve_second.present? and @approve_second.user_id.to_i == current_user.id))

        agency_store = AgencyStore.find_by_resource_id(params[:vehicle][:model_type_id_available])
        @resource_transportation_booking.agency_store_id = agency_store.id
        @resource_transportation_booking.driver_id = agency_store.driver_id
        @resource_transportation_booking.status = "Approved"
        @resource_transportation_booking.department_id = @current_department
        @resource_transportation_booking.requester_id = current_user.id
        @resource_transportation_booking.requested_from_date = (params[:resource_transportation_booking][:requested_from_date]).to_datetime
        @resource_transportation_booking.requested_to_date = (params[:resource_transportation_booking][:requested_to_date]).to_datetime
        @resource_transportation_booking.save
        agency_store.update_attributes(:booked=>true)

        if (session[:current_role] != DISP_USER_ROLE_RESOURCE_MANAGER)
          @approver = Approver.active.find_all_by_department_id(@current_department).first
          @approve_second = Approver.active.find_all_by_department_id(@current_department).last

          if @approver.present?
            user = User.find(@approver.user_id)
            UserMailer.send_mail_to_dept_admin_for_transport_booking(user,@resource_transportation_booking, @resource_transportation_booking.department_id ).deliver
          elsif @approve_second.present?
            user = User.find(@approver.user_id)
            UserMailer.send_mail_to_dept_admin_for_transport_booking(user,@resource_transportation_booking,@resource_transportation_booking.department_id).deliver
          else
            dept = Department.find_by_id(params[:department_id])
            user = dept.users.where("role_id = 2").first
            UserMailer.send_mail_to_dept_admin_for_transport_booking(user,@resource_transportation_booking,@resource_transportation_booking.department_id).deliver
          end
        end
        redirect_to(resource_transportation_bookings_path, :notice => "Your Transport booking has been created sucessfully.")

      else

        @resource_transportation_booking.status = "New"
        @resource_transportation_booking.department_id = @current_department
        @resource_transportation_booking.requester_id = current_user.id
        @resource_transportation_booking.requested_from_date = (params[:resource_transportation_booking][:requested_from_date]).to_datetime
        @resource_transportation_booking.requested_to_date = (params[:resource_transportation_booking][:requested_to_date]).to_datetime
        @resource_transportation_booking.save

        #allocate_resource_for_super_admin_request(@resource_transportation_booking,params[:resource_transportation_booking][:sub_category_id])

        #if (session[:current_role] != DISP_USER_ROLE_RESOURCE_MANAGER)
        @approver = Approver.active.find_all_by_department_id(@current_department).first
        @approve_second = Approver.active.find_all_by_department_id(@current_department).last

        if @approver.present?
          user = User.find(@approver.user_id)
          UserMailer.send_mail_to_dept_admin_for_transport_booking(user,@resource_transportation_booking, @resource_transportation_booking.department_id ).deliver
        elsif @approve_second.present?
          user = User.find(@approver.user_id)
          UserMailer.send_mail_to_dept_admin_for_transport_booking(user,@resource_transportation_booking,@resource_transportation_booking.department_id).deliver
        else
          dept = Department.find_by_id(@current_department)
          user = dept.users.where("role_id = 2").first
          UserMailer.send_mail_to_dept_admin_for_transport_booking(user,@resource_transportation_booking,@resource_transportation_booking.department_id).deliver
        end
        #end
        redirect_to(resource_transportation_bookings_path, :notice => "Your Transport booking has been created sucessfully.")
      end
      disable_the_sub_category_when_that_sub_category_is_fully_reserved(params[:resource_transportation_booking][:sub_category_id])

    else
      if !current_user.is_super_admin?
        @category = CategoriesDepartments.where(:category_id=> 7,:department_id=> @current_department)
        @sub_category = SubCategory.where(:category_id => 7,:is_available => true)
      end
      #@if_inside_agency = AgencyStore.where(:category_id=> 7,:booked=> false,:agency_id => current_user.departments.collect(&:agency_id).join(','))
      render :action=>'new'
    end
  end

  def approve_request
    if session[:current_role] == DISP_USER_ROLE_RESOURCE_MANAGER      
      agency = Department.find(@current_department).agency
      depts = agency.departments.collect(&:id).join(',')     
      @resource_transportation_bookings = ResourceTransportationBooking.where("department_id in (#{depts}) and status !=?", "New").page(params[:page]).per(5)      
      #@resource_transportation_bookings = ResourceTransportationBooking.find(:all,:joins=>["inner join agency_stores on resource_transportation_bookings.agency_store_id = agency_stores.id inner join agencies on agencies.id = agency_stores.agency_id"],:conditions=>[("agencies.user_id = #{current_user.id}")]).page(params[:page]).per(5)   
    else
      @approve = Approver.active.find_all_by_department_id(@current_department).first
      @approver_second = Approver.active.find_all_by_department_id(@current_department).last
      if @approve.present?
        @resource_transportation_bookings = ResourceTransportationBooking.where(:department_id => @approve.department_id).page(params[:page]).per(5)
      elsif @approver_second.present?
        @resource_transportation_bookings = ResourceTransportationBooking.where(:department_id => @approver_second.department_id).page(params[:page]).per(5)
      elsif session[:current_role] == DISP_USER_ROLE_DEPT_ADMIN
        @approver_second = Approver.active.find_all_by_department_id(@current_department).last
        @resource_transportation_bookings = ResourceTransportationBooking.where(:department_id => @current_department).order.page(params[:page]).per(5)
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
            
      agency = Agency.find(@resource_transportation_booking.agency_store.agency_id)        
        if !agency.user_id.nil?
          UserMailer.send_mail_to_resource_manager_for_transport_booking(agency.user,@resource_transportation_booking).deliver #if agency && agency.user  #if resource_manager && resource_manager.user && !resource_manager.user.blank?
        end

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
  #def get_vehicles
  #vehicles = Vehicle.where(:vehicle_type_id => params[:vehicle_type_id])
  #render :json=>[vehicles] if vehicles
  #end

  # Retrieving Driver Details
  def get_driver_details
    @resource = Resource.find(params[:id])    
    @driver = Driver.find(AgencyStore.find_by_resource_id(params[:id]).driver_id)
    render :layout => false
  end

  # Returning the resource once used
  def user_return_status
    rtb = ResourceTransportationBooking.find(params[:id])
    user = User.find(rtb.requester_id)
    if (user.is_super_admin? || user.roles.first.name == "Resource Manager")      
      rtb.update_attributes(:resource_returned_from_user=>true,:status=>"Returned")
      agency_store = AgencyStore.find(rtb.agency_store_id)
      agency_store.update_attribute(:booked,false)     
      disable_the_sub_category_when_that_sub_category_is_fully_reserved(agency_store.sub_category_id) 
    else
    rtb.update_attribute(:resource_returned_from_user,true)
    end
    render :layout => false
  end

  def download_attachments
    @message = ResourceTransportationBooking.find(params[:id])
    send_file @message.attachment.path
  end

end
