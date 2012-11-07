class ResourcesController < ApplicationController
  before_filter :authenticate_user!, :except=>[:activate]
  before_filter :is_admin
  def index
    if params[:id].blank? || params[:id].nil?
     if current_user.is_super_admin?
        @resources=Resource.order.page(params[:page]).per(15)
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
    if @resource.update_attributes(params[:resource_category])
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
 resource_sub_categories= ResourceSubCategory.where("resource_category_id =?",params[:agency_id]) 
    render :json=>[resource_sub_categories] if resource_sub_categories
end

end
