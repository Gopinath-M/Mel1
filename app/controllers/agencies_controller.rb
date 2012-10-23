class AgenciesController < ApplicationController

  def index
    @agencies=nil
    if params[:id].blank? || params[:id].nil?
      @agencies=Agency.order.page(params[:page]).per(15)
    end
  end

  def new
    @agency = Agency.new
  end

  def edit
    @agency = Agency.find(params[:id])
  end

  def create
    @agency = Agency.create(params[:agency])
    @agency.save
    if @agency.valid?
      redirect_to :controller=>'agencies', :action=>'index'
    else
      render :action=>'new'
    end
  end

  def update
    @agency = Agency.find(params[:id]) if params[:id]
    if @agency.update_attributes(params[:agency])
      redirect_to(agencies_path, :notice => 'Agency has been successfully updated.')
    else
      render :action=>'new'
    end
  end

  def update_status
    @agency = Agency.find(params[:id])
    if params[:status]=="Activate"
      @agency.update_attribute(:status,"A")
    elsif params[:status]=="Deactivate"
      @agency.update_attribute(:status,"I")
    end
    redirect_to(agencies_path, :notice => 'Agency Status has been successfully changed.')
  end

  def destroy
    @agency = Agency.find(params[:id])
    @agency.destroy
    #    department_id= !params[:department_id].blank? || !params[:department_id].nil? ?  params[:department_id] : nil
    redirect_to(agencies_path, :notice => 'Agency has been Deleted.')
  end

end
