class OutstationsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  def index
    @outstations = Outstation.find_all_by_user_id(current_user.id)
  end

  def approve_request_for_state
    if session[:current_role] == DISP_USER_ROLE_DEPT_USER
      @outstations = Outstation.find_all_by_user_id_and_is_out_of_state(current_user.id,true)
    elsif session[:current_role] == DISP_USER_ROLE_DEPT_ADMIN
      #@outstations = Outstation.where(:department_id=>@current_department,:is_out_of_state=>true)
      @outstations = Outstation.find(:all,:conditions=>["user_id != ? and department_id = ? and is_out_of_state = ?",current_user.id,current_department,true])
    elsif session[:current_role] == DISP_USER_ROLE_HUMAN_RESOURCE
      @outstations = Outstation.find(:all,:conditions=>["status != 'New' and is_out_of_state = true"])
    elsif session[:current_role] == DISP_USER_ROLE_SUK_DEPUTY
      users = RoleMembership.where(:role_id=>2).collect(&:user_id).compact.join(',')
      @outstations = Outstation.find(:all,:conditions=>["(((status = 'Recommended' or status = 'Approved') and is_out_of_state = true) or ((status='New' or status='Verified') and user_id in (#{users}) and is_out_of_state = true)) "])
    elsif session[:current_role] == DISP_USER_ROLE_CHIEF_MINISTER
      users = RoleMembership.where(:role_id=>2).collect(&:user_id).compact.join(',')
      @outstations = Outstation.find(:all,:conditions=>["((status='Recommended' or status='Approved') and user_id in (#{users}) and is_out_of_state = true)"])
    elsif session[:current_role] == DISP_USER_ROLE_DATUK_SUK
      users = RoleMembership.where(:role_id=>2).collect(&:user_id).compact.join(',')
      @outstations = Outstation.find(:all,:conditions=>["(((status = 'Recommended' or status = 'Approved') and is_out_of_state = true) or ((status='New' or status='Verified') and user_id in (#{users}) and is_out_of_state = true))"])      
    end
  end

  def approve_request
    if  session[:current_role] == DISP_USER_ROLE_DEPT_USER
      @outstations = Outstation.find_all_by_user_id_and_is_out_of_state(current_user.id,false)
    elsif session[:current_role] == DISP_USER_ROLE_DEPT_ADMIN
      #@outstations = Outstation.where(:department_id=>@current_department,:is_out_of_state=>false)
      @outstations = Outstation.find(:all,:conditions=>["user_id != ? and department_id = ? and is_out_of_state = ?",current_user.id,current_department,false])
    elsif session[:current_role] == DISP_USER_ROLE_HUMAN_RESOURCE
      @outstations = Outstation.find(:all,:conditions=>["status != 'New' and is_out_of_state = false"])
    elsif session[:current_role] == DISP_USER_ROLE_DATUK_SUK
      users = RoleMembership.where(:role_id=>2).collect(&:user_id).compact.join(',')
      @outstations = Outstation.find(:all,:conditions=>["(((status = 'Recommended' or status = 'Approved') and is_out_of_state = false) or ((status='New' or status='Verified') and user_id in (#{users}) and is_out_of_state = false)) "])
    elsif session[:current_role] == DISP_USER_ROLE_CHIEF_MINISTER
      users = RoleMembership.where(:role_id=>2).collect(&:user_id).compact.join(',')
      @outstations = Outstation.find(:all,:conditions=>["((status='Recommended' or status='Approved') and user_id in (#{users}) and is_out_of_state = false)"])
    end
  end


  def new
    @outstations = Outstation.new
  end

  def create
    @outstation = Outstation.new(params[:outstation])

    @outstation.is_out_of_state = (params[:outstation][:is_out_of_state] == 'Out of State' ? 1 : 0)
    @outstation.is_official = (params[:outstation][:is_official] == 'Official' ? 1 : 0)
    #@outstation.from_date = params[:outstation][:from_date].to_datetime
    #@outstation.to_date = params[:outstation][:to_date].to_datetime
    @outstation.department_id = @current_department
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
    case params[:status]
    when 'Verify'
      status = 'Verified'
    when 'Recommend'
      status = 'Recommended'
    when 'Approve'
      status = 'Approved'
    when 'Decline'
      status = 'Declined'
    end
    @outstation.update_attribute(:status,status)
    if @outstation.is_out_of_state?
      redirect_to(approve_request_for_state_outstations_path, :notice => 'Outstation Request has been successfully updated.')
    else
      redirect_to(approve_request_outstations_path, :notice => 'Outstation Request has been successfully updated.')
    end    
  end

end
