class NewslettersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin
  autocomplete User, :email, :full => true
  def new
    @newsletter = Newsletter.new
  end

  def create
    if params[:template][:type]=="All Users"
      newsletter_to = "All Users"
      users = User.active
    elsif params[:template][:type]=="All Dept Admins"
      newsletter_to = "All Dept Admins"
      users =  User.active.joins(:role_memberships).where("role_memberships.role_id=2")
    elsif params[:template][:type]=="Select Agency"
      if params[:template][:agency]!=nil
        departments = Department.active.joins(:agency).where(:agency_id=>params[:template][:agency]).collect(&:id)
        users = User.active.joins(:role_memberships).where("role_memberships.department_id in (?)", departments).collect(&:email)
        newsletter_to = users
      else
        flash[:alert] = 'Please select Agency'
      end
    elsif params[:template][:type]=="Select Department"
      if params[:template][:agency]!=nil && params[:template][:department_id]!=nil
        department = Department.find_by_agency_id_and_id(params[:template][:agency], params[:template][:department_id])
        users = User.active.joins(:role_memberships).where("role_memberships.department_id = ?", department.id).collect(&:email)
        newsletter_to = users
    else
        flash[:alert] = 'Please select Agency and Department'
      end
    elsif  params[:template][:type]=="Select Dept Admin"
      if params[:template][:user_id]!=nil
        users= User.where(:ic_number => params[:template][:user_id]).collect(&:email)
        newsletter_to = users
      else
        flash[:alert] = 'Please select User'
      end
    else
      flash[:alert] = 'Please select a user type'
    end
    p "===========newsletter_to is #{newsletter_to.inspect}"
    if users && !users.empty?
      newsletter_to.uniq!
      p "==========after #{newsletter_to.inspect}"
      @newsletter = Newsletter.create!(params[:newsletter].merge!({:created_by => current_user.id,:from=>current_user.email, :status => "New",:to=>newsletter_to.join(",").to_s}))
    if @newsletter.valid?
      @newsletter.save!
      redirect_to :action => 'index'
    else
      render :action => 'new'
      end
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
