class IctHardwareBookingsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @ict_hardware_bookings=IctHardwareBooking.page(params[:page]).per(4)
  end

  def new
    @ict_hardware_booking=IctHardwareBooking.new
    @ict_hardware_booked_user=@ict_hardware_booking.ict_hardware_booked_users.build
  end

  def create
    @ict_hardware_booking=IctHardwareBooking.create(params[:ict_hardware_booking].merge!({:booker_id=>current_user.id, :department_id=>@current_department}))
    if @ict_hardware_booking.valid?
      @ict_hardware_booking.save
      redirect_to(ict_hardware_bookings_path, :notice => "Resource Requisition ICT Hardware has been booked.")
    else
      render :action=>'new'
    end
  end
  
  def requests
    @approve = Approver.active.find_all_by_department_id(current_user.departments).first
    @approver_second = Approver.active.find_all_by_department_id(current_user.departments).last
    if !@approve.present? && !@approver_second.present?
      @ict_hardware_bookings=IctHardwareBooking.where(:department_id => current_user.departments).order.page(params[:page]).per(4)
    else
      users=IctHardwareBookedUser.where(:forward_to => current_user.id).order.page(params[:page]).per(4)
      @ict_hardware_bookings=users.ict_hardware_booking
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
#    p user = User.find_by_id(ict_hardware.person_incharge)
#    p ordered_user = User.find_by_id(ict_hardware.user_id)
#    UserMailer.send_status_mail_for_ict_network(user,ordered_user,network).deliver
    redirect_to(requests_ict_hardware_bookings_path, :notice => 'Your ICT Hardware booking Status has been successfully updated.')
  end

end
