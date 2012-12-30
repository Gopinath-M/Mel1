class AdvertisementsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @advertisements = Advertisement.where("is_active =? and from_date >=?", true, Time.now).page(params[:page]).per(3)
  end
  def hide_index
    @advertisements = Advertisement.where("is_active =? ", false).page(params[:page]).per(3)
  end

   def advertisement_index
    @advertisements=nil
    if params[:id].blank? || params[:id].nil?
      @advertisements=Advertisement.where(:deleted => false).order.page(params[:page]).per(15)
    end
  end

  def create
    @advertisement = Advertisement.new(params[:advertisement])
    @advertisement.created_by = current_user.id

    if @advertisement.valid?
      @advertisement.save
      redirect_to(new_advertisement_path, :notice => "Advertisement has been created successfully.")
    else
      render :action=>'new'
    end
  end

  def new
    @advertisement = Advertisement.new
  end

  def show
    if !params[:id].nil?
     @advertisements=Advertisement.find(params[:id])
    end
  end

  def hide
    if !params[:id].nil?
      @advertisements=Advertisement.find(params[:id])
    end
  end


  def edit
    @advertisement = Advertisement.find(params[:id])
  end


  def update
    @advertisement = Advertisement.find(params[:id]) if params[:id]
    @advertisement.update_attribute(:updated_by, current_user.id)
    if @advertisement.update_attributes(params[:advertisement])
      redirect_to(advertisement_index_advertisements_path, :notice => 'Advertisement has been successfully updated.')
    else
      render :action=>'new'
    end
  end

  def update_status
    custom_group = Advertisement.find(params[:id])
    if custom_group && params[:status]=="Activate"
      custom_group.update_attribute(:is_active,true)
    elsif custom_group && params[:status]=="Deactivate"
      custom_group.update_attribute(:is_active, false)
    end
    redirect_to(advertisement_index_advertisements_path, :notice => 'Advertisement Status has been successfully changed.')
  end

  def destroy
    @advertisement = Advertisement.find(params[:id])
    @advertisement.deleted = true
    if @advertisement.save
      redirect_to(advertisement_index_advertisements_path, :notice => 'Advertisement has been Deleted.')
    end
  end
end
