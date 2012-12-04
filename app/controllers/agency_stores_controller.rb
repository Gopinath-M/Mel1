class AgencyStoresController < ApplicationController
  before_filter :authenticate_user!, :except=>[:activate]
  before_filter :is_admin
  def index
    @resource_id = params[:resource_id].to_i # while selecting Please Select returns string params
    if @resource_id == 0
    if params[:id].blank? || params[:id].nil?
      if current_user.is_super_admin?
        @stores=AgencyStore.order.page(params[:page]).per(15)
      else
        @stores=AgencyStore.find_all_by_agency_id(@resource_id)
      end
    end
    else
       if current_user.is_super_admin?
        @stores=AgencyStore.find_all_by_agency_id(@resource_id)
      end
    end
     if request.xhr?
      render :layout=>false
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
    @store.resource_type = params[:resource_type]
    if params[:room_agency]
    @store.agency_id = params[:room][:agency_id]
    @store.sub_category_id = params[:room_agency][:sub_category_id]
    @store.resource_id = params[:room_agency][:resource_id]
    
    elsif params[:transport_agency]
    @store.agency_id = params[:transport][:agency_id]
    @store.sub_category_id = params[:transport_agency][:sub_category_id]
    @store.resource_id = params[:transport_agency][:resource_id]
    
    elsif params[:ict_agency]
    @store.agency_id = params[:ict_agency][:agency_id]
    @store.sub_category_id = params[:ict_agency][:sub_category_id]
    @store.resource_id = params[:ict_agency][:resource_id]
    SubCategory.find(@store.sub_category_id).update_attribute(:is_available,true)
    elsif params[:other_agency]
    @store.agency_id = params[:other][:agency_id]
    @store.category_id = params[:other_category][:id]
    @store.sub_category_id = params[:other_agency][:sub_category_id]
    @store.resource_id = params[:other_agency][:resource_id]    
    end
    @store.save
    #    store.categories_id = params[:categories_department][:id]
    #    store.sub_categories_id = params[:sub_categories][:id]
    #    if params[:dynamic]
    #    store.serial_no =  params[:text1] + params[:dynamic].to_s
    #    else
    #    store.serial_no =  params[:text1]
    #    end
    #    store.agency_id = params[:transfer_from][:agency]
    #    @store.save
    
    if @store.valid?
      redirect_to :controller=>'agency_stores', :action=>'index'
    else
      render :action=>'new', :notice =>'Resource already added for this Sub category'
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
    render :json=>[resources] if resources
  end
  def get_categories
    dept = CategoriesDepartment.find_all_by_department_id(params[:agency_id])
    if dept == nil || dept.blank?
      @categories = nil
    else
      @categories = Category.find_all_by_id(dept[0].category_id)
    end
    render :json=>[ @categories] if  @categories
  end
  def get_sub_categories
    subcategories = SubCategory.find_all_by_id(params[:agency_id])
    render :json=>[ subcategories] if  subcategories
  end

  def get_vehicles
    vehicles = Vehicle.find_all_by_vehicle_type_id(params[:vehicle_id])
    render :json=>[ vehicles] if  vehicles
  end
  def get_resources
     agency_stores = AgencyStore.find_by_id(params[:resource_id])
     if agency_stores != nil
     sub_category = SubCategory.find_all_by_id(agency_stores.sub_category_id)
     render :json=>[ sub_category] if  sub_category
     else
       sub_category = 0
       render :json=>[ sub_category] if  sub_category
     end
    
  end
  def get_other_sub_categories
    subcategories = SubCategory.find_all_by_category_id(params[:agency_id])
    render :json=>[ subcategories] if  subcategories
  end

  def get_resource_ict

    resources = Resource.find_all_by_sub_category_id(params[:sub_category_id])
    render :json=>[resources] if resources
  end
end
