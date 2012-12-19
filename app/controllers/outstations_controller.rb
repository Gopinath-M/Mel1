class OutstationsController < ApplicationController
  before_filter :authenticate_user!
  def index
    if current_user.is_department_user?
      @outstations = Outstation.find_all_by_user_id(current_user.id)
    elsif current_user.is_department_admin?
      @outstations = Outstation.where(:department_id=>current_user.departments)
    elsif current_user.is_human_resource_manager?
      @outstations = Outstation.find(:all,:conditions=>["status != ?",'New'])
    elsif current_user.is_datuk_suk?
      users = RoleMembership.where(:role_id=>2).collect(&:user_id).compact.join(',')
      @outstations = Outstation.find(:all,:conditions=>["status = 'Review' or status = 'Approve' or ((status='New' or status='Support') and user_id in (#{users}) )"])
    elsif current_user.is_chief_minister?
      users = RoleMembership.where(:role_id=>2).collect(&:user_id).compact.join(',')
      @outstations = Outstation.find(:all,:conditions=>["((status='Review' or status='Approve') and user_id in (#{users}) )"])
    end    
  end

  def approve_request
    index
  end

  def new
    @outstations = Outstation.new
  end

  def create
    @outstation = Outstation.new(params[:outstation])
    
    @outstation.is_out_of_state = (params[:outstation][:is_out_of_state] == 'Out of State' ? 1 : 0)
    @outstation.is_official = (params[:outstation][:is_official] == 'Official' ? 1 : 0)
    @outstation.from_date = params[:outstation][:from_date].to_datetime
    @outstation.to_date = params[:outstation][:to_date].to_datetime
    @outstation.department_id = current_user.role_memberships.where(:default_dept => true).first.department.id
    @outstation.status = 'New'
    
    if @outstation.valid?
      @outstation.save
      redirect_to outstations_path
    else
      render :action => 'new'
    end
  end

  def show
    @outstation = Outstation.find(params[:id])
  end

  def edit
    @outstation = Outstation.find(params[:id])
  end

  def update
    @outstation = Outstation.find(params[:id])
    @outstation.update_attribute(:status,params[:status])
    redirect_to(approve_request_outstations_path, :notice => 'Outstation Request has been successfully updated.')
  end

end
