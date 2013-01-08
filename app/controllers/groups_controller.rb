class GroupsController < ApplicationController
  def index
    @groups = Group.find_all_by_user_id(current_user.id)
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  def show
  end

  def create
    @group = Group.new(params[:group])
    if @group.valid?
      @group.user_id = current_user.id
      @group.department_id = @current_department
      @group.save
      @group_member = GroupMember.create(:group_id=>@group.id,:user_id=>current_user.id)
      redirect_to :controller =>'groups', :action => 'index'
    else
      render :action => 'new'
    end
  end
  
  def update_status
    group = Group.find(params[:id])
    if group && params[:status]=="Activate"
      group.update_attribute(:is_active,1)
    elsif group && params[:status]=="Deactivate"
      group.update_attribute(:is_active,0)
    end
    redirect_to(groups_path, :notice => 'Group Status has been successfully changed.')
  end

end
