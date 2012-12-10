class ComplaintComputersController < ApplicationController
  before_filter :authenticate_user!
  def index 
  if current_user && current_user.is_super_admin?
      @complaint_computer = ComplaintComputer.page(params[:page]).per(2)
    elsif current_user && current_user.is_department_admin?
      @complaint_computer = ComplaintComputer.page(params[:page]).per(2)
    else
      @complaint_computer = ComplaintComputer.where(:user_id => current_user.id).order.page(params[:page]).per(2)
    end
  end

  def new
    @complaint_computer=ComplaintComputer.new
  end

  def create
    @complaint_computer=ComplaintComputer.create(params[:complaint_computer])
    @complaint_computer.user_id = current_user.id
    @complaint_computer.save
    if @complaint_computer.valid?
      redirect_to(complaint_computers_path, :notice => "Computers has been complained successfully.")
    else
      render :action=>'new'
    end
  end

  def update
    @complaint_computer=ComplaintComputer.find_by_id(params[:id])
    @name = ComplaintType.find_by_id(@complaint_computer.complaint_type_id)
    @system_access_name = SystemAccess.find_by_id(@complaint_computer.system_access_id)
    @system_model_name = SystemModelType.find_by_id(@complaint_computer.system_model_type_id)
    @complaint_computer.update_attributes(params[:complaint_computer])
    
    if @complaint_computer.update_attributes(params[:complaint_computer])
      ict_email = User.find_by_id(@complaint_computer.forward_to)
      UserMailer.complaint_computer(ict_email, @complaint_computer, @name, @system_access_name, @system_model_name, current_user).deliver

      redirect_to(complaint_computers_path, :notice => 'Complained Computers Status has been updated and Mail has been sent successfully')
    else
      render :action=>'new'
    end
  end


  def approval
    @complaint_computer=ComplaintComputer.find_by_id(params[:id])
  end

  def show
    if !params[:id].nil?
      @complaint_computer=ComplaintComputer.find(params[:id])
    end
  end
end
