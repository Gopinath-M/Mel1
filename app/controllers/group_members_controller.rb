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

end
