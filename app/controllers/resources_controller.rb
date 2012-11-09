class ResourcesController < ApplicationController
  before_filter :authenticate_user!, :except=>[:activate]
  before_filter :is_admin, :except=>[:get_resources]
  def index
    if params[:id].blank? || params[:id].nil?
      if current_user.is_super_admin?
        @resources=Resource.order.page(params[:page]).per(10)
      else
        @resources=Resource.find_all_by_department_id(current_department.id)
      end
    end
  end

  def new
    @resource = Resource.new
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def create
    @resource = Resource.create(params[:resource])
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
    redirect_to(resources_path, :notice => 'Resource has been successfully changed.')
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

end
