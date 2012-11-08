class MessagesController < ApplicationController
  
  #Listing out the Messages of logged-in user
  def index
    collect_messages
  end

  #Collecting Messages
  def collect_messages
    
    if current_user && current_user.is_department_user?
      dept_id = current_user.departments.collect(&:id)
      agency_id = current_user.departments.collect(&:agency_id)
      @messages = Message.find(:all,:conditions=>["((agency_id = 0 and department_id = 0 and sent_to_all_dept_admins = 0) || (department_id in (#{dept_id}) and sent_to_all_dept_admins = 0) || (agency_id in (#{agency_id}) and sent_to_all_dept_admins = 0))"],:order => "updated_at desc")

    elsif current_user && current_user.is_super_admin?
      @messages = Message.where(:sender=>current_user.id).order("updated_at desc")

    elsif current_user && current_user.is_department_admin?
      dept_id = current_user.departments.collect(&:id)
      agency_id = current_user.departments.collect(&:agency_id)
      @messages = Message.find(:all,:conditions=>["(((agency_id = 0 and department_id = 0) or sent_to_all_dept_admins = 1) || (department_id in (#{dept_id}) || (agency_id in (#{agency_id})) ))"],:order => "updated_at desc")
    end
    
  end

  #Creating a New Message Instance
  def new
    @message = Message.new
  end

  #Creating a New Message
  def create
    @message = Message.create(params[:message])
    if @message.valid?
      @message.sender, @message.receiver = current_user.id, User.find_by_first_name(params[:receiver]).id      
      @message.save
      redirect_to messages_path
    else
      render :action => 'new'
    end
  end

  #For Auto-complete action
  def autocomplete_user_icnumber
    @users = User.find(:all,:conditions=>["id != ? and first_name like ?",current_user.id,"%#{params[:term]}%"])
    
    a=[]
    for user in @users
      h = {"label"=>user.first_name,"id"=> user.id,"value"=>user.first_name}
      a << h
    end
    render :json => a
  end

  # For Retrieving Agency List
  def get_agencies
    @type = params[:value]
    agencies= Agency.where(:deleted => false)
    render :layout => false    
  end

  # For Retrieving Department List
  def get_departments
    @type = params[:value]    
    render :layout => false   
  end

  # For Retrieving Particular Department Admin
  def get_department_admin
    @agency,@dept = Agency.find(params[:agency]), Department.find(params[:dept])      
    role = @dept.role_memberships.where(:role_id=>2)
    @dept_admin = User.find(role[0].user_id) if !role.blank?
    render :layout => false
  end

  #Posting Messages
  def post_messages

    message = Message.create(:message=>params[:message],:sender=>current_user.id)

    if params[:dept] && params[:dept]!= ""
      message.message_type, message.agency_id, message.department_id, message.sent_to_all_dept_admins = "Department", 0 , params[:dept], false
    elsif params[:agency] && params[:agency]!= ""
      message.message_type, message.agency_id, message.department_id, message.sent_to_all_dept_admins = "Agency", params[:agency], 0, false
    elsif params[:all_admins] && params[:all_admins]!= ""
      message.message_type, message.agency_id, message.department_id, message.sent_to_all_dept_admins = "AllDeptAdmin", 0, 0, true
    elsif params[:dept_admin] && params[:dept_admin]!= ""
      message.message_type, message.agency_id, message.department_id, message.sent_to_all_dept_admins = "DeptAdmin", 0, params[:department], true
    else
      message.message_type, message.agency_id, message.department_id, message.sent_to_all_dept_admins = "Superadmin", 0, 0, false
    end
    
    message.save
    collect_messages

    render :layout => false
  end

  #Posting Comments
  def post_comments
    @message = Message.find(params[:id])
    ms = MessageComment.create(:message_id=>params[:id],:comments=> params[:msg], :commenter_id => current_user.id)    
    render :layout => false
  end
  
end
