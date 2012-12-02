class ResourcesController < ApplicationController
  before_filter :authenticate_user!, :except=>[:activate]
  before_filter :is_admin, :except=>[:get_resources]
  def index
     department_id = params[:department_id].to_i # while selecting Please Select returns string params
    if department_id == 0
    if params[:id].blank? || params[:id].nil?
      if current_user.is_super_admin?
        @resources=Resource.order.page(params[:page]).per(10)
      else
        @resources=Resource.find_all_by_department_id(current_department.id)
      end
    else
      @resources=Resource.find_all_by_sub_category_id(params[:department_id])
    end
    else
      @resources=Resource.find_all_by_sub_category_id(params[:department_id])
  end
   if request.xhr?
      render :layout=>false
    end
  end
  def new
    @resource = Resource.new
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def create
    if params[:resource_type] == "room_booking"
      @resource = Resource.create(params[:resource])
      @resource.resource_type = params[:resource_type]
    elsif  params[:resource_type] =="transport"
      @resource = Resource.create(params[:resource])
      @resource.category_id = params[:resource_transport][:category_id]
      @resource.sub_category_id = params[:resource_transport][:sub_category_id]
      @resource.resource_type = params[:resource_type]
    elsif params[:resource_type] =="others"
      @resource = Resource.create(params[:resource])
      @resource.category_id = params[:resource_other][:category_id]
      @resource.sub_category_id = params[:resource_other][:sub_category_id]
      @resource.resource_type = params[:resource_type]
    end
    @resource.created_by = params[:created_by]
    @resource.save
    if @resource.valid?
      redirect_to :controller=>'resources', :action=>'index'
    else
      render :action=>'new'
    end
  end

  def update
    @resource = Resource.find(params[:id]) if params[:id]
    if @resource.update_attributes(params[:resource])
      redirect_to(resources_path, :notice => 'Resource has been successfully updated.')
    else
      render :action=>'new'
    end
  end

  def update_status
    category = Resource.find(params[:id])
    if category && params[:status]=="Activate"
      category.update_attribute(:is_active,true)
    elsif category && params[:status]=="Deactivate"
      category.update_attribute(:is_active, false)
    end
    redirect_to(resources_path, :notice => 'Resource status has been successfully changed.')
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.deleted = true
    if @resource.save
      redirect_to(resources_path, :notice => 'Resource has been deleted.')
    end
  end

  def get_subcategory
    sub_categories= SubCategory.where("category_id =?",params[:agency_id])
    render :json=>[sub_categories] if sub_categories
  end

  def get_resources
    resources=Resource.where("sub_category_id= ? and deleted=false", params[:sub_category_id])
    render :json=>[resources] if resources
  end

  def get_resource_type
    @resource = Resource.new    
    render :partial => 'form' , :department_id => 'room_booking'
  end

  def get_sub_category
    sub_categories= SubCategory.where("category_id =?",params[:sub_category_id])
    render :json=>[sub_categories] if sub_categories
  end

end
