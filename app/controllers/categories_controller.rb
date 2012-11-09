class CategoriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  def index
    if params[:id].blank? || params[:id].nil?
     if current_user.is_super_admin?
        @categories=Category.where(:deleted => false).order.page(params[:page]).per(15)
      else
        @categories=Category.find_all_by_department_id(current_department.id)
      end
    end
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.create(params[:category])
    @category.created_by = params[:created_by]
    @category.save
    if @category.valid?
      redirect_to :controller=>'categories', :action=>'index'
    else
      render :action=>'new'
    end
  end

  def update
    @category = Category.find(params[:id]) if params[:id]
    if @category.update_attributes(params[:category])
      redirect_to(categories_path, :notice => 'Resource Category has been successfully updated.')
    else
      render :action=>'new'
    end
  end

  def update_status
    category = Category.find(params[:id])
    if category && params[:status]=="Activate"
      category.update_attribute(:is_active,true)
    elsif category && params[:status]=="Deactivate"
      category.update_attribute(:is_active, false)
    end
    redirect_to(categories_path, :notice => 'Resource Category has been successfully changed.')
  end

  def destroy
    @category = Category.find(params[:id])
    @category.deleted = true
    if @category.save
      redirect_to(categories_path, :notice => 'Resource Category has been Deleted.')
    end
  end
  def assign_category
     @category = CategoryDepartment.new
  end
  def update_category
    @category = CategoryDepartment.new
    @category.created_by = params[:created_by]
    @category.department_id = params[:resource_category] [:department_id]
    @category.category_id = params[:resource_category][:resource_category_id]
#    @category.resource_sub_category_id = params[:resource_sub_category][:resource_sub_category_id]
    @category.save
    redirect_to(categories_path, :notice => 'Resource Category has been sucessfully assigned  to Department.')
  end
end
