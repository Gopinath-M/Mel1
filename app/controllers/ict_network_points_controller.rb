class IctNetworkPointsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @requisition = IctNetworkPoint.where(:user_id => current_user.id, :department_id => @current_department).order.page(params[:page]).per(4)
  end

  def new
    @requisition=IctNetworkPoint.new
  end

  def show
    @ict_network = IctNetworkPoint.find(params[:id])
    @type_name  = RequisitionType.find_by_id(@ict_network.requisition_type_id)
  end

  def create    
    requisition=IctNetworkPoint.create(params[:ict_network_point])
    requisition.requisition_type_id = params[:requisition_type_id]
    requisition.user_id = params[:user_id]
    requisition.department_id = params[:department_id]
    requisition.status = "New"
    requisition.save
    @approve = Approver.active.find_all_by_department_id(@current_department).first
    dept = Department.find_by_id(params[:department_id])
    if !@approve.present?
      user = dept.users.where("role_id = 2").first
      UserMailer.send_mail_to_dept_admin_for_ict_network(user,requisition,dept).deliver
    else
      user = User.find_by_id(@approve.user_id)
      UserMailer.send_mail_to_approver_for_ict_network(user,requisition,dept).deliver
    end
    ordered_user = User.find_by_id(requisition.user_id)
    UserMailer.send_mail_to_user_for_ict_network(ordered_user,requisition,dept).deliver
    if requisition.valid?
      redirect_to :controller=>'ict_network_points', :action=>'index'
    else
      render :action=>'new'
    end
  end

  def list_ict_network
    @approve = Approver.active.find_all_by_department_id(@current_department).first
    @approver_second = Approver.active.find_all_by_department_id(@current_department).last
    if !@approve.present? && !@approver_second.present?
      @list_network_point = IctNetworkPoint.where(:department_id => @current_department).order.page(params[:page]).per(4)
    else
      @list_network_point = IctNetworkPoint.where(:person_incharge => current_user.id).order.page(params[:page]).per(4)
    end
    if @approve.present?
      @list_network_point = IctNetworkPoint.where(:department_id => @approve.department_id).order.page(params[:page]).per(4)
      #    else @approver_second.present?
      #      @list_network_point = IctNetworkPoint.where(:department_id => @approver_second.department_id)
    end
  end

  def approval_network_point
    @ict_network = IctNetworkPoint.find(params[:id])
    @type_name  = RequisitionType.find_by_id(@ict_network.requisition_type_id)
  end

  def get_hardware_type
    facility_ict_hardwares = FacilityIctHardware.find(params[:hardware_id])
    render :json=>[facility_ict_hardwares] if facility_ict_hardwares
  end

  def get_location_for_hardware
    facility_ict_wirings = FacilityIctWiring.find_all_by_facility_hardware_id(params[:facility_hardware_id])
    render :json=>[facility_ict_wirings] if facility_ict_wirings
  end

  def update_approval_network_point
    network = IctNetworkPoint.find_by_id(params[:id])
    network.update_attributes(params[:ict_network_point])
    network.update_attribute(:updated_by, params[:updated_by])
    user = User.find_by_id(network.person_incharge)
    ordered_user = User.find_by_id(network.user_id)
    UserMailer.send_status_mail_for_ict_network(user,ordered_user,network).deliver
    UserMailer.send_status_mail_to_person_incharge_for_ict_network(user,ordered_user,network).deliver
    redirect_to(list_ict_network_ict_network_points_path, :notice => 'Your ICT Network Point Status has been successfully updated.')
  end

  def list_to_select_ict
    @ict_hardware_booking=IctHardwareBooking.new
    @ict_hardware_booked_user=@ict_hardware_booking.ict_hardware_booked_users.build
    @ict_vpn=IctVpn.new
    @ict_system_access=IctSystemAccess.new
  end

  def selected_list_ict
  end

  def download_attachments
    @message = IctNetworkPoint.find(params[:id])
    send_file @message.ict_network_attachment.path
  end

  def list_requisition_network
    if params[:ic_number].present?
      users = User.find_by_ic_number(params[:ic_number])
      @requisition = IctNetworkPoint.where(:user_id => users.id).order.page(params[:page]).per(5)
    else
      @requisition = IctNetworkPoint.order.page(params[:page]).per(5)
    end
    if request.xhr?
      render :layout=>false
    end
  end

end
