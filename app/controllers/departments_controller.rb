class DepartmentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin#, :except=>'depart_user_list'

  #List all Department
  def index
    @departments = Department.order("name").page(params[:page]).per(10)
  end

  #new Department
  def new
    @department = Department.new
  end

  #Create a new Department
  def create
    @department = Department.new(params[:department].merge!(:created_by => current_user.id))
    @department.save
    if @department.valid?
      redirect_to(departments_path, :notice => 'Department has been successfully created.')
    else
      render :action=>'new'
    end
  end

  #Edit an Department
  def edit
    @department = Department.find(params[:id])
  end

  #update a Department
  def update
    @department = Department.find(params[:id]) if params[:id]
    if @department.update_attributes(params[:department])
      redirect_to(departments_path, :notice => 'Department has been successfully updated.')
    else
      render :action=>'new'
    end
  end

  #Delete a Department
  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    redirect_to(departments_path, :notice => 'Department has been successfully deleted.')
  end
  
  #Activate or Deactivate a particular Department
  def update_status
    department = Department.find(params[:id])
    if department && params[:status]=="Activate"
      department.update_attribute(:is_active,1)
    elsif department && params[:status]=="Deactivate"
      department.update_attribute(:is_active,0)
    end
    redirect_to(departments_path, :notice => 'Department Status has been successfully changed.')
  end

  #  def depart_list
  #    @department = User.find(:all, :conditions => ["role_id = 2"])
  #  end
  #
  #  def depart_user_list
  #    @users = User.find(:all, :conditions => ["department_id = ? and role_id = 3", current_user.department_id])
  #  end
end
