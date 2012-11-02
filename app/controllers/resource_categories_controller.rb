class ResourceCategoriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  def index
    if params[:id].blank? || params[:id].nil?
      @resources=ResourceCategory.where(:deleted => false).order.page(params[:page]).per(15)
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
end
