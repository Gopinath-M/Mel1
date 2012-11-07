class ResourceCategoriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  def index
    if params[:id].blank? || params[:id].nil?
     if current_user.is_super_admin?
        @resources=ResourceCategory.where(:deleted => false).order.page(params[:page]).per(15)
      else
        @resources=ResourceCategory.find_all_by_department_id(current_department.id)
      end
    end
  end

  def new
    @resource = ResourceCategory.new
  end

  def edit
    @resource = ResourceCategory.find(params[:id])
  end

  def create
    @resource = ResourceCategory.create(params[:resource_category])
    @resource.created_by = params[:created_by]
    @resource.save
    if @resource.valid?
      redirect_to :controller=>'resource_categories', :action=>'index'
    else
      render :action=>'new'
    end
  end

  def update
    @resource = ResourceCategory.find(params[:id]) if params[:id]
    if @resource.update_attributes(params[:resource_category])
      redirect_to(resource_categories_path, :notice => 'Resource Category has been successfully updated.')
    else
      render :action=>'new'
    end
  end

  def update_status
    category = ResourceCategory.find(params[:id])
    if category && params[:status]=="Activate"
      category.update_attribute(:is_active,true)
    elsif category && params[:status]=="Deactivate"
      category.update_attribute(:is_active, false)
    end
    redirect_to(resource_categories_path, :notice => 'Resource Category has been successfully changed.')
  end

  def destroy
    @resource = ResourceCategory.find(params[:id])
    @resource.deleted = true
    if @resource.save
      redirect_to(resource_categories_path, :notice => 'Resource Category has been Deleted.')
    end
  end
  def assign_category
     @resource = ResourceCategory.new
  end
  def update_category
    @resource = DeptCategory.new
    @resource.created_by = params[:created_by]
    @resource.department_id = params[:resource_category] [:department_id]
    @resource.resource_category_id = params[:resource_category][:resource_category_id]
#    @resource.resource_sub_category_id = params[:resource_sub_category][:resource_sub_category_id]
    @resource.save
    redirect_to(resource_categories_path, :notice => 'Resource Category has been sucessfully updated.')
  end
end
