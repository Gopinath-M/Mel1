class ResourceIctEquipmentBookingsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @resource_ict_equipment_bookings=ResourceIctEquipmentBooking.order.page(params[:page]).per(10)
  end

  def new
    @resource_ict_equipment_booking = ResourceIctEquipmentBooking.new
    @category = CategoriesDepartments.where(:category_id=>8,:department_id=> @current_department)
  end

  def create
    @category = CategoriesDepartments.where(:category_id=>8,:department_id=> @current_department)
    @resource_ict_equipment_booking = ResourceIctEquipmentBooking.create(params[:resource_ict_equipment_booking])
    if @resource_ict_equipment_booking.valid?
      @resource_ict_equipment_booking.save
      redirect_to resource_ict_equipment_bookings_path
    else
      render :action=>'new'
    end
  end
end
