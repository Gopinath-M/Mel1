class ResourceBookingsController < ApplicationController
  def new
    @resource_booking=ResourceBooking.new
  end

  def create
    @resource_booking=ResourceBooking.create(params[:resource_booking])
    @resource_booking.save
    if @resource_booking.valid?
      redirect_to resource_bookings_path
    else
      render :action=>'new'
    end
  end
end
