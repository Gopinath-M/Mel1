class SoftwareInstallationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @software_installation = SoftwareInstallation.all
    @software_installation_detail = SoftwareInstallationDetail.all
  end

  def new
    @software_installation = SoftwareInstallation.new
  end

  def create
    software_installation = SoftwareInstallation.create(params[:software_installation])
    software_installation.status = 'New'
    software_installation.save
    software_installation_details = SoftwareInstallationDetail.new(params[:service])
    software_installation_details.software_installation_id = software_installation.id
    software_installation_details.user_id = current_user.id
    software_installation_details.department_id = current_user.departments
    software_installation_details.save
    render :action =>'index'
  end
  def update
    @software_installation_detail=SoftwareInstallationDetail.find_by_id(params[:id])
    @software_installation=SoftwareInstallation.find(@software_installation_detail.software_installation_id)
    @requisition=RequisitionType.find(@software_installation.requisition_type_id)
    if @software_installation_detail.update_attributes(params[:software_installation_detail])
      if @software_installation.status == 'New'
      @software_installation.status = 'Approved'
      if params[:software_installation_detail][:approve_status] == "Approve"
        @software_installation_detail.approve_status = 1
        @software_installation_detail.save
      else
        @software_installation_detail.approve_status = 0
        @software_installation_detail.save
      end
      @software_installation.user_id = params[:software_installation_detail][:user_id]
      elsif @software_installation.status = 'Approved'
        @software_installation.status = 'Processed'
      end
      @software_installation.save
      software_email = User.find_by_id(@software_installation.user_id)
     UserMailer.ict_software(software_email, @software_installation_detail, @requisition, current_user).deliver
      redirect_to(software_installations_path, :notice => 'Booked Requisition Software Installation has been updated and Mail has been sent successfully')
    else
      render :action=>'new'
    end
  end

  def approval_software_installation
    @software_installation = SoftwareInstallation.all
  end
   def show
    if !params[:id].nil?
      @software_installation_detail=SoftwareInstallationDetail.find(params[:id])
    end
  end

  def resource_booking_approval
   @software_installation_detail=SoftwareInstallationDetail.find(params[:id])
   @software_installation=SoftwareInstallation.find(@software_installation_detail.software_installation_id)
   @requisition=RequisitionType.find(@software_installation.requisition_type_id)
    if @software_installation_detail.update_attributes(params[:software_installation])
      software_email = User.find(@software_installation_detail.user_id)
#      UserMailer.ict_software(software_email, @software_installation_detail, @requisition, current_user).deliver
#      redirect_to(software_installations_path, :notice => 'Booked Requisition Software Installation has been updated and Mail has been sent successfully')
    else
      render :action=>'new'
    end
  end
end
