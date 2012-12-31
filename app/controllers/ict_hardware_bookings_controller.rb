class IctHardwareBookingsController < ApplicationController
  before_filter :authenticate_user!

  def index
    if session[:current_role] == DISP_USER_ROLE_SUPER_ADMIN
      @ict_hardware_bookings=IctHardwareBooking.where(:booker_id=>current_user.id).page(params[:page]).per(5)
    else
      @ict_hardware_bookings=IctHardwareBooking.where(:booker_id=>current_user.id, :department_id => @current_department).page(params[:page]).per(5)
    end
    
  end

  def new
    @ict_hardware_booking=IctHardwareBooking.new
    @ict_hardware_booked_user=@ict_hardware_booking.ict_hardware_booked_users.build
  end

  def create
    @ict_hardware_booking = IctHardwareBooking.create(params[:ict_hardware_booking].merge!({:booker_id=>current_user.id, :department_id=>@current_department}))
    @ict_hardware_booking.application_category = params[:ict_hardware_booking][:ict_hardware_booked_users_attributes].keys.length >1 ? "Group" : "Individual"
    if @ict_hardware_booking.valid?
      @ict_hardware_booking.save
      @approve = Approver.active.where(:department_id => @current_department).first
      dept = Department.find(@current_department)
      if !@approve.present?
        user = dept.users.where("role_id = 2").first
        #        UserMailer.send_mail_to_dept_admin_for_ict_hardware(user,@ict_hardware_booking,dept).deliver
      else
        user = User.find_by_id(@approve.user_id)
        #        UserMailer.send_mail_to_approver_for_ict_hardware(user,@ict_hardware_booking,dept).deliver
      end
      UserMailer.send_mail_to_dept_admin_for_ict_hardware(user,@ict_hardware_booking,dept).deliver
      redirect_to(ict_hardware_bookings_path, :notice => "Resource Requisition ICT Hardware has been booked.")
    else
      render :action=>'new'
    end
  end
  
  def requests
    @approve = Approver.active.where(:department_id => @current_department).first
    @approver_second = Approver.active.where(:department_id => @current_department).last
    if !@approve.present? && !@approver_second.present?
      @ict_hardware_bookings=IctHardwareBooking.where(:department_id => @current_user_department).order.page(params[:page]).per(5)
    else
      bookings=IctHardwareBookedUser.where(:forward_to => current_user.id).collect(&:ict_hardware_booking_id)
      @ict_hardware_bookings=IctHardwareBooking.find(bookings) if bookings && !bookings.empty?
    end
    if @approve.present?
      @ict_hardware_bookings = IctHardwareBooking.where(:department_id => @approve.department_id).order.page(params[:page]).per(5)
    end
  end
  
  def update
  end

  def approve
    @ict_hardware_booking = IctHardwareBooking.find(params[:id]) #ict_hardware_booking
    @ict_hardware_booked_user = @ict_hardware_booking.ict_hardware_booked_users.first

  end

  def update_request
    @ict_hardware_booking = IctHardwareBooking.find(params[:id])
    @ict_hardware_booked_user = @ict_hardware_booking.ict_hardware_booked_users.first
    if !params[:user][:forward_to].nil? &&  params[:user][:forward_to]!="" && @ict_hardware_booked_user.status=="New"
      @ict_hardware_booking.ict_hardware_booked_users.each do |booking|
        status = !params[:user][:status].blank? &&  params[:user][:status].nil? && params[:user][:status]["#{booking.id}"] ? params[:user][:status]["#{booking.id}"] : "Approved"
        booking.update_attributes!(:status => params[:user][:status]["#{booking.id}"], :remarks=>params[:user][:remarks], :forward_to=>params[:user][:forward_to])
        p booking.inspect
        p booking.officer.inspect
        UserMailer.send_status_mail_for_ict_hardware(booking.officer, @ict_hardware_booking.booker, @ict_hardware_booking,booking).deliver
      end
      redirect_to(requests_ict_hardware_bookings_path, :notice => 'Your ICT Hardware booking Status has been successfully updated.')
    elsif @ict_hardware_booked_user.status == "Approved"
      @ict_hardware_booking.ict_hardware_booked_users.each do |booking|
        status = !params[:user][:status].blank? &&  params[:user][:status].nil? && params[:user][:status]["#{booking.id}"] ? params[:user][:status]["#{booking.id}"] : "Processed"
        booking.update_attributes!(:status => params[:user][:status]["#{booking.id}"], :remarks=>params[:user][:remarks])
        UserMailer.send_status_mail_for_ict_hardware(booking.officer, @ict_hardware_booking.booker, @ict_hardware_booking,booking).deliver
      end
       redirect_to(requests_ict_hardware_bookings_path, :notice => 'Your ICT Hardware booking Status has been successfully updated.')
    else
      flash[:alert]="Select user to process request"
      render :action=>"approve" , :id=>@ict_hardware_booking.id
    end
  end

  def show
    @ict_hardware_booking = IctHardwareBooking.find(params[:id])
  end

end
