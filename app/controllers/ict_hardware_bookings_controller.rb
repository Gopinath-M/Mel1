class IctHardwareBookingsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @ict_hardware_bookings=IctHardwareBooking.page(params[:page])
  end

  def new
    @ict_hardware_booking=IctHardwareBooking.new
    @ict_hardware_booked_user=@ict_hardware_booking.ict_hardware_booked_users.build
  end

  def create
    @ict_hardware_booking=IctHardwareBooking.create(params[:ict_hardware_booking].merge!({:booker_id=>current_user.id}))
    if @ict_hardware_booking.valid?
      @ict_hardware_booking.save
      redirect_to(ict_hardware_bookings_path, :notice => "Resource Requisition ICT Hardware has been booked.")
    else
      render :action=>'new'
    end
  end
  
  def requests
    @ict_hardare_booking=IctHardareBooking.find(params[:id])
  end
  
  def update

  end

end
