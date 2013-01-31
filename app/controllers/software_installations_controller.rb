class SoftwareInstallationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @software_installation = SoftwareInstallation.all
    @software_installation_detail = SoftwareInstallationDetail.all
    @approve = Approver.active.find_all_by_department_id(current_user.departments).first
    @approver_second = Approver.active.find_all_by_department_id(current_user.departments).last
    if !@approve.present? && !@approver_second.present?
      @approve_list = SoftwareInstallation.where(:department_id => current_user.departments).order.page(params[:page]).per(4)
    else
      @approve_list = SoftwareInstallation.where(:person_incharge => current_user.id).order.page(params[:page]).per(4)
    end
    if @approve.present?
      @approve_list = SoftwareInstallation.where(:department_id => @approve.department_id).order.page(params[:page]).per(4)
    end
  end

  def new
    @software_installation = SoftwareInstallation.new
  end

  def create
    @software_installation = SoftwareInstallation.create(params[:software_installation])
    @software_installation.requisition_type_id = params[:requisition_type_id]
    @software_installation.user_id = current_user.id
    @software_installation.status = 'New'
    @software_installation.save
    @software_installation_details = SoftwareInstallationDetail.new(params[:service])
    @software_installation_details.software_installation_id = @software_installation.id
    @software_installation_details.facility_ict_software_id = params[:name][:service_detail]
    @software_installation_details.user_id = current_user.id
    @software_installation_details.department_id = current_user.departments
    @software_installation_details.save
    if params[:service_detail]
      @software_installation_details = SoftwareInstallationDetail.new
      @software_installation_details.software_installation_id = @software_installation.id
      @software_installation_details.facility_ict_software_id = params[:service_detail][:software]
      @software_installation_details.user_id = current_user.id
      @software_installation_details.department_id = current_user.departments
      @software_installation_details.name = params[:service_detail][:name]
      @software_installation_details.position = params[:service_detail][:position]
      @software_installation_details.grade = params[:service_detail][:grade]
      @software_installation_details.save
      n = params[:total_service_count].to_i
      i = 0
      if !n.blank?
        for i in 0..n
          #          @software_installation_details = SoftwareInstallationDetail.create(params[:"service_#{n}"])
        end
      end
    end
    @approve = Approver.active.find_all_by_department_id(current_user.departments).first
    dept = Department.find_by_id(current_user.departments)
    if !@approve.present?
      user = dept.users.where("role_id = 2").first
      UserMailer.send_mail_to_dept_admin_for_ict_software(user,@software_installation_details,@software_installation,dept).deliver
    else
      user = User.find_by_id(@approve.user_id)
      UserMailer.send_mail_to_approver_for_ict_software(user,@software_installation_details,@software_installation,dept).deliver
    end
    if @software_installation_details.valid?
      # new code ends
    end
    redirect_to(software_installations_path, :notice => 'Requisition for Software Installation created sucessfully')
  end
  def update
    @software_installation=SoftwareInstallation.find(params[:id])
    @software_installation_detail=SoftwareInstallationDetail.find_all_by_software_installation_id(@software_installation.id)
    @requisition=RequisitionType.find(@software_installation.requisition_type_id)
    if params[:status][:id] == 'Approved'
      @software_installation.person_incharge = params[:software][:person_incharge]
      @software_installation.status == 'New'
      @software_installation.status = 'Approved'
      if params[:software_installation_detail][:approve_status] == "Approve"
        @software_installation_detail[0].approve_status = 1
        @software_installation_detail[0].save
      else
        @software_installation_detail[0].approve_status = 0
        @software_installation_detail[0].save
      end
    else
      @software_installation.status = 'Processed'
    end
    if @software_installation.valid?
      @software_installation.save
      software_email = User.find_by_id(@software_installation.user_id)
      UserMailer.ict_software(software_email, @software_installation_detail, @requisition, current_user).deliver
      redirect_to(software_installations_path, :notice => 'Requisition for Software Installation has been updated and Mail has been sent successfully')
    else
      render :action=>'new'
    end
  end

  def approval_software_installation
    @software_installation = SoftwareInstallation.all
  end
  def show
    if !params[:id].nil?
      @software_installation=SoftwareInstallation.find(params[:id])
    end
  end

  def resource_booking_approval
    @software_installation=SoftwareInstallation.find(params[:id])
    @software_installation_detail=SoftwareInstallationDetail.find_all_by_software_installation_id(@software_installation.id)
    @requisition=RequisitionType.find(@software_installation.requisition_type_id)
    #    if @software_installation_detail.update_attributes(params[:software_installation])
    if @software_installation.update_attributes(params[:software_installation])
      software_email = User.find(@software_installation.user_id)
      UserMailer.ict_software(software_email, @software_installation, @requisition, current_user).deliver
      #      redirect_to(software_installations_path, :notice => 'Booked Requisition Software Installation has been updated and Mail has been sent successfully')
    else
      render :action=>'new'
    end
  end

  def download_attachments
    @download = SoftwareInstallation.find(params[:id])
    send_file @download.software_attachment.path
  end
  def add_select_boxes
    @val = params[:incre]
  end

  def list_requisition_softwares
    if params[:ic_number].present?
      users = User.find_by_ic_number(params[:ic_number])
      @software_installation = SoftwareInstallation.where(:user_id => users.id).order.page(params[:page]).per(5)
    else
      @software_installation = SoftwareInstallation.order.page(params[:page]).per(5)
    end
    if request.xhr?
      render :layout=>false
    end
  end


end
