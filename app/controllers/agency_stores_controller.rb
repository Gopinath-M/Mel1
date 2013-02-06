class AgencyStoresController < ApplicationController
  before_filter :authenticate_user!, :except=>[:activate]
  before_filter :is_admin, :except=>[:get_resource,:get_agency_resource,:get_other_resource]
  load_and_authorize_resource :only=>[:new,:index,:create,:update,:edit,:destroy]
  def index
    if params[:resource_id] && params[:resource_id] != '' && params[:resource_id]!=0
      @resource_id = params[:resource_id].to_i
      @stores = AgencyStore.where(:agency_id => @resource_id).order.page(params[:page]).per(10)
    else
      @stores = AgencyStore.order.page(params[:page]).per(10)
    end
    @resource_id = params[:resource_id].to_i # while selecting Please Select returns string params
    #    if @resource_id == 0
    #      if params[:id].blank? || params[:id].nil?
    #        if current_user.is_super_admin?
    #          @stores=AgencyStore.order.page(params[:page]).per(10)
    #        else
    #          @stores=AgencyStore.where(:agency_id=>@resource_id).order.page(params[:page]).per(10)
    #        end
    #      end
    #    else
    #      if current_user.is_super_admin?
    #        @stores=AgencyStore.where(:agency_id=>@resource_id).order.page(params[:page]).per(10)
    #      end
    #    end
    if request.xhr?
      render :layout => false
    end

    
  end

  def new
    @store = AgencyStore.new
  end

  def edit
    @store = AgencyStore.find(params[:id])
  end

  def create
    stock_flag =[]
    stock_flag_errors = []
    if params[:room_agency]
      @store = AgencyStore.new(params[:agency_store])
      @store.resource_type = params[:resource_type]
      @store.agency_id = params[:room][:agency_id]
      @store.sub_category_id = params[:room_agency][:sub_category_id]
      @store.resource_id = params[:room_agency][:resource_id]
      resource = Resource.find(params[:room_agency][:resource_id]).update_attribute(:alloted,true)
      #      @store.save
    elsif params[:transport_agency]
      @store = AgencyStore.new(params[:agency_store])
      @store.resource_type = params[:resource_type]
      @store.agency_id = params[:transport][:agency_id]
      @store.driver_id = params[:transport][:driver_id]
      @store.sub_category_id = params[:transport_agency][:sub_category_id]
      @store.resource_id = params[:transport_agency][:resource_id]
      resource = Resource.find(params[:transport_agency][:resource_id]).update_attribute(:alloted,true)
      #      SubCategory.find(@store.sub_category_id).update_attribute(:is_available,true)
      #      @store.save
    elsif params[:ict_agency]
      stocks=[]
      if params[:dynamic_serial_no] &&  params[:dynamic_serial_no]!=""
        serial_nos = params[:dynamic_serial_no]
        serial_nos.each do |key,value|
          if value != nil && value != ''
            store = AgencyStore.new(:resource_type=>"ICT", :agency_id => params[:ict][:agency_id], :sub_category_id =>  params[:ict_agency][:sub_category_id], :resource_id => params[:ict_agency][:resource_id], :serial_no => value )
            stocks << store
            if store.valid?
              stock_flag << "true"
            else
              stock_flag_errors<< store.errors.full_messages.to_sentence
              stock_flag << "false"
            end
          end
        end
        if stock_flag.include?("false")
          @store = AgencyStore.new(:resource_type=>"ICT", :agency_id => params[:ict][:agency_id], :sub_category_id =>  params[:ict_agency][:sub_category_id], :resource_id => params[:ict_agency][:resource_id])
          stock_flag_errors.uniq!
          flash[:alert] = stock_flag_errors.to_s
          render :action => 'new'
        else
          resource = Resource.find(params[:ict_agency][:resource_id]).update_attribute(:alloted,true)
          stocks.each do |stock|
            stock.save
          end
          flash[:notice] = 'Agency Store has been successfully created.'
          redirect_to :controller=>'agency_stores', :action=>'index'
        end
      else
        @store = AgencyStore.create(:resource_type=>"ICT", :agency_id => params[:ict][:agency_id], :sub_category_id =>  params[:ict_agency][:sub_category_id], :resource_id => params[:ict_agency][:resource_id], :quantity=>params[:ict_agency][:quantity] )
        resource = Resource.find(params[:ict_agency][:resource_id]).update_attribute(:alloted,true)
      end


    elsif params[:other_agency]
      @store = AgencyStore.new(params[:agency_store])
      quantity = params[:agency_store][:quantity].to_i
      @store.resource_type = params[:resource_type]
      @store.agency_id = params[:other][:agency_id]
      @store.category_id = params[:other_category][:id]
      @store.sub_category_id = params[:other_agency][:sub_category_id]
      @store.resource_id = params[:other_agency][:resource_id]
      @store.serial_no =  params[:dynamic].values.join(',').to_s if params[:dynamic]
    end
    if @store && @store.valid? && stock_flag.empty?
      @store.save
      SubCategory.find(@store.sub_category_id).update_attribute(:is_available,true) if params[:transport_agency] #params[:ict_agency]
      flash[:notice] = 'Agency Store has been successfully created.'
      redirect_to :controller=>'agency_stores', :action=>'index'
    elsif @store &&  !@store.valid? && stock_flag.empty?
      render :action => 'new', :notice => 'Resource already added for this Sub category'
    end
  end

  def update
    @store = AgencyStore.find(params[:id]) if params[:id]
    if @store.update_attributes(params[:agency_store])
      redirect_to(agency_stores_path, :notice => 'Agency Store has been successfully updated.')
    else
      render :action => 'new'
    end
  end

  def update_status
    store = AgencyStore.find(params[:id])
    if store && params[:status] == "Activate"
      store.update_attribute(:is_active,true)
    elsif store && params[:status] == "Deactivate"
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
    render :json => [resources] if resources
  end

  def get_categories
    dept = CategoriesDepartment.where(:department_id => params[:agency_id])
    if dept == nil || dept.blank?
      @categories = nil
    else
      @categories = Category.where(:id => dept[0].category_id)
    end
    render :json=>[ @categories] if  @categories
  end
  
  def get_sub_categories
    subcategories = SubCategory.where(:id => params[:agency_id])
    render :json => [ subcategories] if  subcategories
  end

  def get_vehicles
    vehicles = Vehicle.where(:vehicle_type_id => params[:vehicle_id])
    render :json => [ vehicles] if  vehicles
  end

  def get_resources
    agency_stores = AgencyStore.find(params[:resource_id])
    if agency_stores != nil
      sub_category = SubCategory.where(:id => agency_stores.sub_category_id)
      render :json => [ sub_category] if  sub_category
    else
      sub_category = 0
      render :json => [ sub_category] if  sub_category
    end
  end

  def get_other_sub_categories
    subcategories = SubCategory.where(:category_id => params[:agency_id])
    render :json=>[ subcategories] if  subcategories
  end

  def get_resource
    #    if session[:current_role] == DISP_USER_ROLE_SUPER_ADMIN
    #      resources = Resource.where("sub_category_id = ? ", params[:sub_category_id])
    #      render :json=>[resources] if resources
    #    else
    if params[:from] != 'agency_store'
      if session[:current_role] == DISP_USER_ROLE_SUPER_ADMIN
        resource = AgencyStore.where("booked = false and sub_category_id = ?",params[:sub_category_id]).collect(&:resource_id)
      else
        department = Department.find(@current_department)
        resource = AgencyStore.where("booked = false and sub_category_id = ? and agency_id = ? ",params[:sub_category_id],department.agency_id).collect(&:resource_id)
      end
      resources = []
      if resource && !resource.empty?
        resources = Resource.active.find_all_by_id(resource)
      end
      #      resources = Resource.where("sub_category_id = ? ", params[:sub_category_id])
    else
      resources = Resource.active.where("sub_category_id = ? ", params[:sub_category_id])
    end
    render :json=>[resources] if resources
    #    end
  end

  def get_other_resource
    if session[:current_role] == DISP_USER_ROLE_SUPER_ADMIN
      agency_resources = AgencyStore.where("booked = false and sub_category_id = ?",params[:sub_category_id])#.collect(&:resource_id)
    else
      department = Department.find(@current_department)
      agency_resources = AgencyStore.where("booked = false and sub_category_id = ? and agency_id != ? ",params[:sub_category_id],department.agency_id)#.collect(&:resource_id)
    end
    if params[:resource_type] && (params[:resource_type] == "room" ||  params[:resource_type] == "others")
      resources={}
      agency_resources.each do |store|
        val = store.resource.resource_no.to_s + "-" + store.agency.name
        resources.store(store.resource.id,val)
      end
    else
      resources = []
      agency_resources.each do |store|
        resources << store.resource
      end
      resources.uniq!
      resources.compact!
    end
    render :json => [resources] if resources
  end
  
  def get_agency_resource
    resources = {}
    if session[:current_role] != DISP_USER_ROLE_SUPER_ADMIN
      department = Department.find(@current_department)
    end
    temp_resources = AgencyStore.where("resource_id = ? and booked = ? ",params[:resource_id],false)
    temp_resources.each do |resource|
      if department && department.present? && department.agency_id == resource.agency_id
        resources.store(resource.id, resource.serial_no.to_s) if !resource.serial_no.nil?
        resources = "no serial" if resource.serial_no.nil? && resource.quantity == 1
      elsif department && department.present? && department.agency_id != resource.agency_id
        if resource.serial_no.nil? && resource.quantity==1
          val = resource.agency.name.to_s if resource != nil
        else
          val = resource != nil && resource.serial_no != "" ? (resource.serial_no.to_s + "-" +resource.agency.name.to_s) : resource.agency.name.to_s
        end
        resources.store(resource.id, val)
      end
    end
    p resources.inspect
    resources = "no serial" if resources == {}
    render :json=>[resources] if resources
  end

end
