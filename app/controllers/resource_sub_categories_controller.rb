class ResourceSubCategoriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  def index
    if params[:id].blank? || params[:id].nil?
      @resources=ResourceSubCategory.where(:deleted => false).order.page(params[:page]).per(15)
    end
  end

  def new
    @resource = ResourceSubCategory.new
  end

  def edit
    @resource = ResourceSubCategory.find(params[:id])
  end

  def create
    @resource = ResourceSubCategory.create(params[:resource_sub_category])
    @resource.save
    if @resource.valid?
      redirect_to :controller=>'resource_sub_categories', :action=>'index'
    else
      render :action=>'new'
    end
  end

  def update
    @resource = ResourceSubCategory.find(params[:id]) if params[:id]
    if @resource.update_attributes(params[:resource_sub_category])
      redirect_to(resource_sub_categories_path, :notice => 'Resource Sub Category has been successfully updated.')
    else
      render :action=>'new'
    end
  end

  def update_status
    sub_category = ResourceSubCategory.find(params[:id])
    if sub_category && params[:status]=="Activate"
      sub_category.update_attribute(:is_active,true)
    elsif sub_category && params[:status]=="Deactivate"
      sub_category.update_attribute(:is_active, false)
    end
    redirect_to(resource_sub_categories_path, :notice => 'Resource Sub Category has been successfully changed.')
  end

  def destroy
    @resource = ResourceSubCategory.find(params[:id])
    @resource.deleted = true
    if @resource.save
      redirect_to(resource_sub_categories_path, :notice => 'Resource Sub Category has been Deleted.')
    end
  end
end
