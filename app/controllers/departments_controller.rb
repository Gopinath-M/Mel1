class DepartmentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin, :except=>'depart_user_list'
  
  def index

    @departments = Department.order("name").page(params[:page]).per(10)
    if params[:del] !=nil
      @id = params[:id]
      @update_dept_status = Department.find(@id.to_i)
      if params[:del] == "A"
        @update_dept_status.is_active = 0
        @update_dept_status.save
      elsif params[:del] == "DA"
        @update_dept_status.is_active = 1
        @update_dept_status.save
      end
        
    end
  end

  def show
    
    
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(params[:department].merge!(:created_by => current_user.id))
    @department.save
    if @department.valid?
      redirect_to :controller=>'departments', :action=>'index'
    else
      render :action=>'new'
    end
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @id = params[:id]
    @department = Department.find(@id.to_i)
    if params[:del] != nil
      @department = Department.find(@id.to_i)
      if params[:del] == "DA"
        @department.is_active = 0
      elsif params[:del] == "A"
        @department.is_active = 1
      else
        @department.is_active = 0
      end
      @department.save
    end
    if params[:department] != nil
      @department.update_attributes(params[:department])
    end
    if @department.valid?
      redirect_to :controller=>'departments', :action=>'index'
    else
      render :action=>'new'
    end
  end
 
  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    redirect_to :controller=>'departments', :action=>'index'
  end
  
  def active
    @department = Department.find(params[:id])
    @department.is_active = 0
    @department.save
  end

  def depart_list
    @department = User.find(:all, :conditions => ["role_id = 2"])
  end

  def depart_user_list

   @users = User.find(:all, :conditions => ["department_id = ? and role_id = 3", current_user.department_id])

  end
end
