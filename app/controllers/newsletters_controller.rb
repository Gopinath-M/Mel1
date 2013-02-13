class NewslettersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  autocomplete User, :email, :full => true
  def new
    @newsletter = Newsletter.new
  end

  def create
    if params[:newsletter_to]!=''
      @newsletter = Newsletter.create(params[:newsletter].merge!({:created_by => current_user.id, :status => "New",:to=>params[:newsletter_to]}))
    else
      @newsletter = Newsletter.create(params[:newsletter].merge!({:created_by => current_user.id, :status => "New",:to=>"All"}))
    end
    if @newsletter.valid?
      @newsletter.save!
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
  
  def autocomplete_email
    searched_users = []
    search_terms = params[:term].include?(",") ? params[:term].split(",") : [params[:term]]
    search_terms.each do |term|
      term.strip!
      searched_users << User.find(:all,:conditions=>["email like (?)", "%#{term}%"]).collect(&:email)
    end
    searched_users.flatten!
    searched_users.uniq!
    h = {"label"=>searched_users.join(","),"id"=> searched_users.join(","),"value"=>searched_users.join(",")}
    render :json => h
  end
 

end
