class DepartmentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  
  def index
    #@departments = Department.all
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
    @department = Department.new
    if params[:id] == "destroy"
      redirect_to :action=>"destory"
    end
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
    @id = params[:id]
    @department = Department.find(@id.to_i)
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
end
