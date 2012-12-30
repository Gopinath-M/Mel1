class ConversationGroupsController < ApplicationController
  def index
    if current_user && current_user.is_super_admin?
      @custom_groups = CustomGroupUser.page(params[:page]).per(2)
    elsif current_user && current_user.is_department_admin?
      @custom_groups = CustomGroupUser.page(params[:page]).per(2)
    else
      @custom_groups = CustomGroupUser.where("user_id != ?", current_user.id).order.page(params[:page]).per(5)
    end

    if params[:custom_group_id].present?
      @custom_group_id = params[:custom_group_id].to_i # while selecting Please Select returns string params
      @custom_group_users = CustomGroupUser.where("custom_group_id = ? and assign_user_id != ?", @custom_group_id, current_user.id).order.page(params[:page]).per(5)
    else
      if !params[:department_id].nil?
        department = Department.find_by_id(params[:department_id])
        @users = department.users.where("users.deleted = false and username != ?", current_user.username).page(params[:page]).per(5)
      else
        default_department ||= current_user.role_memberships.first.department_id
        @dept = Department.find_by_id(default_department)
        @users = @dept.users.where("users.deleted = false and username != ?", current_user.username).page(params[:page]).per(5) if @dept
      end
    end
    if request.xhr?
      render :layout=>false
    end

  end
  
 def show
   
    if params[:id]
     @user=User.find(params[:id])
     @conversation_group_name = ConversationGroup.find_all_by_to_userid(params[:id])
     @conversation_group_name.each do |conversation_group_name|
 p 'eeeeeeeee', conversation_group_name.inspect
     @custom_group_name = CustomGroupUser.find_all_by_custom_group_id_and_department_id(conversation_group_name.from_groupid, current_user.departments)
   p'f555555555', @custom_group_name
   
     end
 @custom_group_name.each do |custom_group_name|
   p'6666666666', custom_group_name.custom_group_id

     @user_name = ConversationGroup.find_all_by_from_groupid_and_to_groupid(@custom_group_name, @custom_group_name)
    p'h4444444', @user_name.inspect

     end
 
      if @user
        @conversation_groups = ConversationGroup.convos(params[:id],current_user.id)
    
      end
  
      if request.xhr?
        render :layout=>false
      end
    end
#    @custom_group = ConversationGroup.all
#    @chat_conv = ConversationGroup.convos(params[:id],current_user.id).order('created_at desc').limit(5)
#    @conversation_group_history = ConversationGroup.all

    @users = User.find(:all, :conditions => ["username != ?", current_user.username])
  end



  def create

#
#         @user_id = RoleMembership.find_by_role_id_and_department_id_and_default_dept_and_status(2, current_user.departments, true, "A")
#    p '44444444', @user_id.inspect
#
#   @department_admin_name = User.find(@user_id)
#    p '555555555555', @department_admin_name.inspect
#    p 'ddddd', @department_admin_name.username

    
    @conversation_groups = ConversationGroup.create!(params[:conversation_group])
    @conversation_groups.from_userid = current_user.id
    @conversation_groups.user_id = current_user.id
    @conversation_groups.department_id = current_user.departments
    @conversation_groups.save
  end

 
end
