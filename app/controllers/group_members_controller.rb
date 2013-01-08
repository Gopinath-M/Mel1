class GroupMembersController < ApplicationController
  
  def index
    @groups = Group.find_all_by_user_id(current_user.id)
  end

  def new
    @group_member = GroupMember.new
    @dept = Department.find(@current_department)
    @users = @dept.users
  end

  def edit
     @group_member = GroupMember.find(params[:id])
  end

  def show
  end

  def create
    @group_member = GroupMember.new(params[:group_member])
    if @group_member.valid?      
      @group_member.save
      redirect_to :controller =>'group_members',:action =>'index'
    else
      @dept = Department.find(@current_department)
      @users = @dept.users
      render :action => 'new'
    end
  end

   def update
    @group_member = GroupMember.find(params[:id]) if params[:id]
    if @group_member.update_attributes(params[:group_member])
      redirect_to(groups_path, :notice => 'Group Member has been successfully updated.')
    else
      render :action=>'new'
    end
  end

  def update_status
    group_member = GroupMember.find(params[:id])
    if group_member  && params[:status]=="Activate"
      group_member.update_attribute(:is_active,true)
    elsif group_member  && params[:status]=="Deactivate"
      group_member.update_attribute(:is_active, false)
    end
    redirect_to(group_members_path, :notice => 'Group Member Status has been successfully changed.')
  end

  def destroy
    @group_member = GroupMember.find(params[:id])
    @group_member.deleted = true
    if @group_member.save
      redirect_to(group_members_path, :notice => 'Group Member has been Deleted.')
    end
  end

end
