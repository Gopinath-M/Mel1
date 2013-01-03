class EventsController < ApplicationController
  before_filter :authenticate_user!
     
  def index
    @events = Event.where("is_active =? and from_date >=?", true, Time.now).page(params[:page]).per(5)
  end

  def hide_index
    @events = Event.where("is_active =?", false).page(params[:page]).per(5)
  end

  def event_index
    @events=nil
    if params[:id].blank? || params[:id].nil?
      @events=Event.where(:deleted => false).order.page(params[:page]).per(10)
    end
  end

  def new
    @event = Event.new(params[:event])
  end

  def create   
    @event = Event.create(params[:event])
    @event.created_by = current_user.id
    if @event.valid?
      redirect_to(list_event_events_path, :notice => "Event has been created successfully.")
    else
      render :action=>'new'
    end
  end  

  def show
    if !params[:id].nil?
      @events = Event.find(params[:id])
    end
  end

  def hide
    if !params[:id].nil?
      @events = Event.find(params[:id])
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id]) if params[:id]
    @event.update_attribute(:updated_by, current_user.id)
    if @event.update_attributes(params[:event])
      redirect_to(event_index_events_path, :notice => 'Event has been successfully updated.')
    else
      render :action=>'new'
    end
  end

  def update_status
    custom_group = Event.find(params[:id])
    if custom_group && params[:status]=="Activate"
      custom_group.update_attribute(:is_active,true)
    elsif custom_group && params[:status]=="Deactivate"
      custom_group.update_attribute(:is_active, false)
    end
    redirect_to(event_index_events_path, :notice => 'Event Status has been successfully changed.')
  end

  def destroy
    @event = Event.find(params[:id])
    @event.deleted = true
    if @event.save
      redirect_to(event_index_events_path, :notice => 'Event has been Deleted.')
    end
  end

  def list_event    
  end
end
