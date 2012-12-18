class OutstationsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @outstations = Outstation.all
  end

  def new
    @outstations = Outstation.new
  end

  def create
    @outstation = Outstation.new(params[:outstation])
    
    @outstation.is_out_of_state = (params[:outstation][:is_out_of_state] == 'Out of State' ? 1 : 0)
    @outstation.is_official = (params[:outstation][:is_official] == 'Official' ? 1 : 0)
    @outstation.from_date = params[:outstation][:from_date].to_datetime
    @outstation.to_date = params[:outstation][:to_date].to_datetime
    
    if @outstation.valid?
      @outstation.save
      redirect_to outstations_path
    else
      render :action => 'new'
    end
  end

  def show
  end

  def edit
  end

end
