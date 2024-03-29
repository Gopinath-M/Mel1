class IctVpnsController < ApplicationController
  before_filter :authenticate_user!
  def index
    if current_user && current_user.is_super_admin?
      @ict_vpn = IctVpn.page(params[:page]).per(5)
    elsif current_user && current_user.is_department_admin?
      @ict_vpn = IctVpn.page(params[:page]).per(5)
    else
      p @ict_vpn = IctVpn.where(:user_id => current_user.id, :department_id => @current_department).order.page(params[:page]).per(5)
      p @current_department
       
    end
  end

  def new
    @ict_vpn=IctVpn.new
  end

  def create
    @ict_vpn = IctVpn.create(params[:ict_vpn])
    @ict_vpn.requisition_type_id = params[:requisition_type_id]
    @ict_vpn.user_id = current_user.id
    @ict_vpn.department_id = @current_department
    if @ict_vpn.valid?
      @ict_vpn.save
      @approve = Approver.active.find_all_by_department_id(@current_department).first
      dept = Department.find_by_id(@current_department)
      @requisition_ict_vpn=RequisitionType.find(@ict_vpn.requisition_type_id)
      @system_access_ict_vpn=SystemAccess.find(@ict_vpn.system_access_id)
      if !@approve.present?
        ict_email = User.find_by_id(@ict_vpn.user_id)
        UserMailer.send_mail_to_ict_vpn(ict_email, @ict_vpn, @requisition_ict_vpn, @system_access_ict_vpn, current_user).deliver
    
        ict_email = dept.users.where("role_id = 2").first
        UserMailer.send_mail_to_ict_vpn(ict_email, @ict_vpn, @requisition_ict_vpn, @system_access_ict_vpn, current_user).deliver
      else
        ict_email = User.find_by_id(@ict_vpn.user_id)
        UserMailer.send_mail_to_ict_vpn(ict_email, @ict_vpn, @requisition_ict_vpn, @system_access_ict_vpn, current_user).deliver

        ict_email = User.find_by_id(@approve.user_id)
        UserMailer.send_mail_to_ict_vpn(ict_email, @ict_vpn, @requisition_ict_vpn, @system_access_ict_vpn, current_user).deliver
      end

      redirect_to(ict_vpns_path, :notice => "Resource Requisition ICT VPN has been created successfully.")
    else
      render :action=>'new'
    end
  end

  def update
    
    @ict_vpn=IctVpn.find_by_id(params[:id])
    @requisition_ict_vpn=RequisitionType.find(@ict_vpn.requisition_type_id)
    @system_access_ict_vpn=SystemAccess.find(@ict_vpn.system_access_id)
    @ict_vpn.update_attributes(params[:ict_vpn])
    
    if @ict_vpn.update_attributes(params[:ict_vpn])
      ict_email = User.find_by_id(@ict_vpn.forward_to)
      UserMailer.send_mail_to_ict_vpn(ict_email, @ict_vpn, @requisition_ict_vpn, @system_access_ict_vpn, current_user).deliver
      ict_email = User.find_by_id(@ict_vpn.user_id)
      UserMailer.send_mail_to_ict_vpn(ict_email, @ict_vpn, @requisition_ict_vpn, @system_access_ict_vpn, current_user).deliver

      redirect_to(list_vpn_ict_vpns_path, :notice => 'Booked Requisition ICT VPN has been updated and Mail has been sent successfully')
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
      @ict_vpns = IctVpn.find_by_forward_to(params[:forward_to])
    end
  end

  def download_attachments
    @ict_vpn = IctVpn.find(params[:id])
    send_file @ict_vpn.vpn_attachment.path
  end


  def list_vpn
    @approve = Approver.active.find_all_by_department_id(@current_department).first
    @approver_second = Approver.active.find_all_by_department_id(@current_department).last
    if !@approve.present? && !@approver_second.present?
      @list_vpn = IctVpn.where(:department_id => @current_department).order.page(params[:page]).per(4)
    else
      @list_vpn = IctVpn.where(:forward_to  => current_user.id).order.page(params[:page]).per(4)
    end
    if @approve.present?
      @list_vpn = IctVpn.where(:department_id => @approve.department_id).order.page(params[:page]).per(4)
    end
  end

  def list_requisition_vpn
    if params[:ic_number].present?
      users = User.find_by_ic_number(params[:ic_number])
      @ict_vpn = IctVpn.where(:user_id => users.id).order.page(params[:page]).per(5)
    else
      @ict_vpn = IctVpn.order.page(params[:page]).per(5)
    end
    if request.xhr?
      render :layout=>false
    end
  end

end
