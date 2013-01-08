class ConversationGroupsController < ApplicationController
  def index 

    if current_user && current_user.is_super_admin?   
      @group_name_admins = Group.find_all_by_department_id_and_is_active(params[:department_id],true)
    elsif current_user && current_user.is_department_admin?
      @group_names = GroupMember.where("user_id=? and is_active =?", current_user.id, true)
    else 
      @group_names = GroupMember.where("user_id=?  and is_active =?", current_user.id, true)    
    end     
    if request.xhr?
      render :layout=>false
    end
  end
  
  def show
    if params[:id]
      @group_name=Group.find(params[:id])
      if @group_name
        @conversation_groups=ConversationGroup.convos(params[:id],params[:id])
        @group_names = Group.find(params[:id])
        @conversation_group_name = ConversationGroup.find_all_by_from_groupid_and_to_groupid_and_department_id(@group_names.id, @group_names.id, @current_department)
      end
      if request.xhr?
        render :layout=>false
      end
    end
  end



  def create    
    @conversation_groups = ConversationGroup.create!(params[:conversation_group])
    @conversation_groups.user_id = current_user.id
    @conversation_groups.department_id = @current_department
    @conversation_groups.save
  end


 
end
