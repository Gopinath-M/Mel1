class AgenciesController < ApplicationController
  before_filter :authenticate_user!
  
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
    if @agency.update_attributes(params[:agency])
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
    from_user =  User.find_by_ic_number(params[:transfer][:username])
    if from_user
      agency = Agency.find(params[:transfer_from][:agency])
      @role_membership = RoleMembership.new(:department_id => 0, :user_id => from_user.id, :role_id => '5', :status => 'A')
      if @role_membership.valid?
        @role_membership.save
        agency.update_attribute(:user_id, from_user.id)
        redirect_to(role_memberships_agencies_path, :notice  =>  'Resource Manager has been Successfully Assigned.')
      else
        render :action => 'assign_resource_manager'
      end
    else
      redirect_to(role_memberships_agencies_path, :alert => 'Resource Manager cannot be Successfully Assigned.')
    end
  end

  def role_memberships
    @role_memberships = RoleMembership.where("department_id is not null and department_id != 0 ").order("department_id asc").page(params[:page]).per(10)
  end

end
