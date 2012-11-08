class AgencyStoresController < ApplicationController
  before_filter :authenticate_user!, :except=>[:activate]
  before_filter :is_admin
  def index
    if params[:id].blank? || params[:id].nil?
     if current_user.is_super_admin?
        @stores=AgencyStore.order.page(params[:page]).per(15)
      else
        @stores=AgencyStore.find_all_by_department_id(current_department.id)
      end
    end
  end

  def new
    @store = AgencyStore.new
  end

  def edit
    @store = AgencyStore.find(params[:id])
  end

  def create
    @store = AgencyStore.create(params[:agency_store])
    @store.save
    if @store.valid?
      redirect_to :controller=>'agency_stores', :action=>'index'
    else
      render :action=>'new'
    end
  end

  def update
    @store = AgencyStore.find(params[:id]) if params[:id]
    if @store.update_attributes(params[:agency_store])
      redirect_to(agency_stores_path, :notice => 'Agency Store has been successfully updated.')
    else
      render :action=>'new'
    end
  end

  def update_status
    store = AgencyStore.find(params[:id])
    if store && params[:status]=="Activate"
      store.update_attribute(:is_active,true)
    elsif store && params[:status]=="Deactivate"
      store.update_attribute(:is_active, false)
    end
    redirect_to(agency_stores_path, :notice => 'Agency Store has been successfully changed.')
  end

  def destroy
    store = AgencyStore.find(params[:id])
    store.deleted = true
    if store.save
      redirect_to(agency_stores_path, :notice => 'Agency Store has been Deleted.')
    end
  end
def get_resource

    resources = Resource.find_all_by_sub_category_id(params[:agency_id])
    p'kkkkkkkkkkkkkkkkkkkkkk',resources
    render :json=>[resources] if resources
end
def get_categories
   dept = CategoriesDepartment.find_all_by_category_id(params[:agency_id])
   categories = Category.find_all_by_id(dept[0].category_id)
   render :json=>[ categories] if  categories
end
def get_sub_categories
   subcategories = SubCategory.find_all_by_id(params[:agency_id])
   render :json=>[ subcategories] if  subcategories
end
end