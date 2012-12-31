class GroupsController < ApplicationController
  def index
    @groups = Group.find_all_by_user_id(current_user.id)
  end

  def new
    @group = Group.new
  end

  def edit
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

end
