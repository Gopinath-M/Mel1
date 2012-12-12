class ComplaintBuildingAssetsController < ApplicationController
  before_filter :authenticate_user!
  def index    
    if current_user && current_user.is_super_admin?
      @complaint_building_asset = ComplaintBuildingAsset.page(params[:page]).per(2)
    elsif current_user && current_user.is_department_admin?
      @complaint_building_asset = ComplaintBuildingAsset.page(params[:page]).per(2)
    else
      @complaint_building_asset = ComplaintBuildingAsset.where(:user_id => current_user.id).order.page(params[:page]).per(2)
    end
  end

  def new
    @complaint_building_asset=ComplaintBuildingAsset.new
  end

  def create
    @complaint_building_asset=ComplaintBuildingAsset.create(params[:complaint_building_asset])
    @complaint_building_asset.user_id = current_user.id
    @complaint_building_asset.save
    if @complaint_building_asset.valid?
      redirect_to(complaint_building_assets_path, :notice => "Building Asset has been complained successfully.")
    else
      render :action=>'new'
    end

  end

  def update
    @complaint_building_asset=ComplaintBuildingAsset.find_by_id(params[:id])
    @category_name = BuildingAssetType.find_by_id(@complaint_building_asset.building_asset_type_id) if @complaint_building_asset.building_asset_type_id
    @type_name = BuildingAssetType.find_by_id(@complaint_building_asset.type_id)
    @item_name = BuildingAssetType.find_by_id(@complaint_building_asset.item_id)
    @complaint_building_asset.update_attributes(params[:complaint_building_asset])
    
    if @complaint_building_asset.update_attributes(params[:complaint_building_asset])
      ict_email = User.find_by_id(@complaint_building_asset.forward_to)
      UserMailer.complaint_building_asset(ict_email, @complaint_building_asset, @category_name, @type_name, @item_name, current_user).deliver

      redirect_to(complaint_building_assets_path, :notice => 'Complained Building Asset Status has been updated and Mail has been sent successfully')
    else
      render :action=>'new'
    end
  end


  def approval
    @complaint_building_asset=ComplaintBuildingAsset.find_by_id(params[:id])
  end

  def show
    if !params[:id].nil?
      @complaint_building_asset=ComplaintBuildingAsset.find(params[:id])
    end
  end

  def get_categories
    building_asset_types = BuildingAssetType.where("parent_type_id =?",params[:category_id]).order('name asc')
    render :json=>[building_asset_types] if building_asset_types
  end
  def get_categories_types
    building_asset_types = BuildingAssetType.where("parent_type_id =?",params[:category_type_id]).order('name asc')
    render :json=>[building_asset_types] if building_asset_types
  end

end

