class IctSystemAccessesController < ApplicationController

  def index
    if current_user && current_user.is_super_admin?
      @ict_system_access = IctSystemAccess.page(params[:page]).per(2)
    elsif current_user && current_user.is_department_admin?
      @ict_system_access = IctSystemAccess.page(params[:page]).per(2)
    else
      @ict_system_access = IctSystemAccess.where(:user_id => current_user.id).order.page(params[:page]).per(2)
    end
  end

  def new
    @ict_system_access=IctSystemAccess.new
  end

  def create
    @ict_system_access=IctSystemAccess.create(params[:ict_system_access])
    @ict_system_access.user_id = current_user.id
    @ict_system_access.save
    if @ict_system_access.valid?
      redirect_to(new_ict_system_access_path, :notice => "Resource Requisition ICT System Access has been created.")
    else
      render :action=>'new'
    end
  end

  def update
      @ict_system_access=IctSystemAccess.find_by_id(params[:id])
      @requisition_ict_system_access=RequisitionType.find(@ict_system_access.requisition_type_id)
      @system_access_ict_system_access=SystemAccess.find(@ict_system_access.system_access_id)
      if @ict_system_access.update_attributes(params[:ict_system_access])
        ict_email = User.find_by_id(@ict_system_access.forward_to)
        UserMailer.ict_system_access(ict_email, @ict_system_access, @requisition_ict_system_access, @system_access_ict_system_access, current_user).deliver

        redirect_to(ict_system_accesses_path, :notice => 'Booked Resource ICT System Access has been updated and Mail has been sent successfully')
      else
        render :action=>'new'
      end
    end


    def approval
      @ict_system_access=IctSystemAccess.find_by_id(params[:id])
      @requisition_ict_system_access=RequisitionType.find(@ict_system_access.requisition_type_id)
    end

    def show
      if !params[:id].nil?
        @ict_system_access=IctSystemAccess.find(params[:id])
      end
    end


    def download_attachments
      @ict_system_access = IctSystemAccess.find(params[:id])
      send_file @ict_system_access.system_access_attachment.path
    end

  end
