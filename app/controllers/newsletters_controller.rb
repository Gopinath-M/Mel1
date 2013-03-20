class NewslettersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  autocomplete User, :email, :full => true
  def new
    @newsletter = Newsletter.new
  end
  def create
    @newsletter = Newsletter.create!(params[:newsletter].merge!({:created_by => current_user.id, :from=>current_user.email,:status => "New",:to=>params[:template][:type], :agency => params[:template][:agency], :department => params[:template][:department_id], :user => params[:template][:user_id]}))
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
