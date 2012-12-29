class IctHardwareBookingsController < ApplicationController
  before_filter :authenticate_user!

  def index
    if session[:current_role] == DISP_USER_ROLE_SUPER_ADMIN
      @ict_hardware_bookings=IctHardwareBooking.where(:booker_id=>current_user.id).page(params[:page]).per(1)
    else
      @ict_hardware_bookings=IctHardwareBooking.where(:booker_id=>current_user.id, :department_id => @current_department).page(params[:page]).per(1)
    end
    
  end

  def new
    @ict_hardware_booking=IctHardwareBooking.new
    @ict_hardware_booked_user=@ict_hardware_booking.ict_hardware_booked_users.build
  end

  def create
    @ict_hardware_booking = IctHardwareBooking.create(params[:ict_hardware_booking].merge!({:booker_id=>current_user.id, :department_id=>@current_department}))
    p params[:ict_hardware_booking][:ict_hardware_booked_users_attributes].keys
    @ict_hardware_booking.application_category = params[:ict_hardware_booking][:ict_hardware_booked_users_attributes].keys.length >1 ? "Group" : "Individual"
    if @ict_hardware_booking.valid?
      @ict_hardware_booking.save
      @approve = Approver.active.where(:department_id => @current_department).first
      dept = Department.find(@current_department)
      if !@approve.present?
        user = dept.users.where("role_id = 2").first
        UserMailer.send_mail_to_dept_admin_for_ict_hardware(user,@ict_hardware_booking,dept).deliver
      else
        user = User.find_by_id(@approve.user_id)
        UserMailer.send_mail_to_approver_for_ict_hardware(user,@ict_hardware_booking,dept).deliver
      end
      redirect_to(ict_hardware_bookings_path, :notice => "Resource Requisition ICT Hardware has been booked.")
    else
      render :action=>'new'
    end
  end
  
  def requests
#    approvers = Approver.active.where(:department_id => @current_department)
#    if approvers && !approver.empty?
#      @first_approver = approvers.first.user if approvers.first && approvers.first.user
#      @second_approver = approvers.first.user if approvers.last && approvers.last.user
#
#    end
#
    @approve = Approver.active.where(:department_id => @current_department).first
    @approver_second = Approver.active.where(:department_id => @current_department).last
    if !@approve.present? && !@approver_second.present?
      @ict_hardware_bookings=IctHardwareBooking.where(:department_id => current_user.departments).order.page(params[:page]).per(4)
    else
      users=IctHardwareBookedUser.where(:forward_to => current_user.id).order.page(params[:page]).per(4)
      @ict_hardware_bookings=users.ict_hardware_booking if users && !users.empty?
    end
    if @approve.present?
      @ict_hardware_bookings=IctHardwareBooking.where(:department_id => @approve.department_id).order.page(params[:page]).per(4)
    end
  end
  
  def update
  end

  def approve
    @ict_hardware_booked_user=IctHardwareBookedUser.find(params[:id])
    @ict_hardware_booking=@ict_hardware_booked_user.ict_hardware_booking
  end

  def update_request
    @ict_hardware_booked_user=IctHardwareBookedUser.find(params[:id])
    @ict_hardware_booked_user.update_attributes(params[:ict_hardware_booked_user])
    user = @ict_hardware_booked_user.officer
    ordered_user = @ict_hardware_booked_user.ict_hardware_booking.booker
    UserMailer.send_status_mail_for_ict_hardware(user, ordered_user, @ict_hardware_booked_user.ict_hardware_booking,@ict_hardware_booked_user).deliver
    redirect_to(requests_ict_hardware_bookings_path, :notice => 'Your ICT Hardware booking Status has been successfully updated.')
  end

end
