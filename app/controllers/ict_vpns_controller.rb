class IctVpnsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    if current_user && current_user.is_super_admin?
      @ict_vpn = IctVpn.page(params[:page]).per(2)
    elsif current_user && current_user.is_department_admin?
      @ict_vpn = IctVpn.page(params[:page]).per(2)
    else
      @ict_vpn = IctVpn.where(:user_id => current_user.id).order.page(params[:page]).per(2)
    end
  end

  def new
    @ict_vpn=IctVpn.new
  end

  def create
    @ict_vpn = IctVpn.create(params[:ict_vpn].merge!({:user_id=>current_user.id}))
    @ict_vpn.requisition_type_id = params[:requisition_type_id]
    if @ict_vpn.valid?
      @ict_vpn.save
      redirect_to(ict_vpns_path, :notice => "Resource Requisition ICT VPN has been created successfully.")
    else
      render :action=>'new'
    end
  end

  def update
    @ict_vpn=IctVpn.find_by_id(params[:id])
    @requisition_ict_vpn=RequisitionType.find(@ict_vpn.requisition_type_id)
    @system_access_ict_vpn=SystemAccess.find(@ict_vpn.system_access_id)
    if @ict_vpn.update_attributes(params[:ict_vpn])
      ict_email = User.find_by_id(@ict_vpn.forward_to)
      UserMailer.ict_vpn(ict_email, @ict_vpn, @requisition_ict_vpn, @system_access_ict_vpn, current_user).deliver
      redirect_to(ict_vpns_path, :notice => 'Booked Requisition ICT VPN has been updated and Mail has been sent successfully')
    else
      render :action=>'new'
    end
  end

  def approval
    @ict_vpn=IctVpn.find_by_id(params[:id])
    @requisition_ict_vpn=RequisitionType.find(@ict_vpn.requisition_type_id)
  end

  def show
    if !params[:id].nil?
      @ict_vpn=IctVpn.find(params[:id])
    end
  end

end
