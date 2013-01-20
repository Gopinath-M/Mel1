class NewslettersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  
  def new
    @newsletter = Newsletter.new
  end

  def create
    @newsletter = Newsletter.create(params[:newsletter].merge!({:created_by => current_user.id, :status => "New"}))
    if @newsletter.valid?
      @newsletter.save!
      Thread.new do
        obj = DRbObject.new(nil,"druby://localhost:2901")
        obj.send_newsletter
      end
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def send_newsletter
  end

  def index
    @newsletters = Newsletter.order("created_at desc").page(params[:page]).per(10)
  end

end
