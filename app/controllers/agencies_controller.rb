class AgenciesController < ApplicationController  
  before_filter :authenticate_user!
  load_and_authorize_resource
  def index
    @agencies = nil
    if params[:id].blank? || params[:id].nil?
      @agencies = Agency.where(:deleted => false).order.page(params[:page]).per(10)
    end    
  end

  def new
    @agency = Agency.new
  end

  def edit
    @agency = Agency.find(params[:id])
  end

  def create
    @agency = Agency.create(params[:agency])
    if @agency.valid?
      @agency.save
      redirect_to :controller =>'agencies', :action => 'index'
    else
      render :action => 'new'
    end
  end

  def update
    @agency = Agency.find(params[:id]) if params[:id]
    if @agency.present? && @agency.update_attributes(params[:agency])
      redirect_to(agencies_path, :notice => 'Agency has been successfully updated.')
    else
      render :action => 'new'
    end
  end

  def update_status
    agency = Agency.find(params[:id])
    if agency && params[:status] == "Activate"
      agency.update_attribute(:is_active,true)
    elsif agency && params[:status] == "Deactivate"
      agency.update_attribute(:is_active, false)
    end
    redirect_to(agencies_path, :notice => 'Agency Status has been successfully changed.')
  end

  def destroy
    @agency = Agency.find(params[:id])
    @agency.deleted = true
    if @agency.save
      redirect_to(agencies_path, :notice => 'Agency has been Deleted.')
    end
  end

  def assign_resource_manager
    @role_membership = RoleMembership.new
  end

  def update_assign_resource_manager
    if params[:role_membership][:user_id] != '' && params[:role_membership][:department_id] != ''
      user = User.find_by_ic_number(params[:role_membership][:user_id])
      if user.present?
        role_member = RoleMembership.where("user_id = ?  and department_id = ? and role_id = 5 ",user.id,params[:role_membership][:department_id]) 
        @role_membership = RoleMembership.new
        agency = Agency.find(params[:role_membership][:agency])
        if agency && !agency.user_id.present?
          @role_membership = RoleMembership.create(params[:role_membership].merge!({:user_id => user.id, :role_id => '5', :status => 'A'}))
          @role_membership.save
          agency.update_attribute(:user_id, user.id)
          redirect_to(list_resource_manager_agencies_path, :notice  =>  'Resource Manager has been Successfully Assigned.')
        else
          dept = agency.departments
          dept.each do |department|
            role = RoleMembership.find_by_department_id(department.id)
            role.update_attribute(:user_id, user.id)
            role.update_attribute(:department_id, params[:role_membership][:department_id])
            agency.update_attribute(:user_id, user.id)
          end
          redirect_to(list_resource_manager_agencies_path, :notice  =>  'Resource Manager for this Agency has been Successfully Changed.')
        end
      else
        flash[:alert] = "User is not found"
        render :action => 'assign_resource_manager'
      end
    else
      @role_membership = RoleMembership.new
      flash[:alert] = "Please select all details"
      render :action => 'assign_resource_manager'
    end
  end

  def role_memberships
    @role_memberships = RoleMembership.where("department_id is not null and department_id != 0 ").order("department_id asc").page(params[:page]).per(10)
  end

  def list_resource_manager
    @role_memberships = RoleMembership.where("role_id = 5 ").page(params[:page]).per(10)
  end

end
