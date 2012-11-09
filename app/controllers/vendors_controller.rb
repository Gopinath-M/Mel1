class VendorsController < ApplicationController
  before_filter :authenticate_user!, :except=>[:activate]
  before_filter :is_admin
   def index
    @vendors=nil
    if params[:id].blank? || params[:id].nil?
      @vendors=Vendor.order.page(params[:page]).per(15)
    end
  end

  def new
    @vendor = Vendor.new
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def create
    @vendor = Vendor.create(params[:vendor])
    @vendor.save
    if @vendor.valid?
      redirect_to :controller=>'vendors', :action=>'index'
    else
      render :action=>'new'
    end
  end

  def update
    @vendor = Vendor.find(params[:id]) if params[:id]
    if @vendor.update_attributes(params[:vendor])
      redirect_to(vendors_path, :notice => 'Vendor has been successfully updated.')
    else
      render :action=>'new'
    end
  end

  def update_status
    vendor = Vendor.find(params[:id])
    if vendor && params[:status]=="Activate"
      vendor.update_attribute(:is_active,true)
    elsif vendor && params[:status]=="Deactivate"
      vendor.update_attribute(:is_active, false)
    end
    redirect_to(vendors_path, :notice => 'Vendor Status has been successfully changed.')
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.deleted = true
    if @vendor.save
      redirect_to(vendors_path, :notice => 'Vendor has been Deleted.')
    end
  end
def vendor_store
  @vendor_store  = VendorStore.new
end
end
