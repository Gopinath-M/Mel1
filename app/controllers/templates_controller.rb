class TemplatesController < ApplicationController

  def new
    @template = Template.new
  end
  
  def create   
    @template = Template.create(params[:template])
    @template.user_id = current_user.id
    if @template.save
      redirect_to templates_path 
    else 
      render templates_path 
    end
  end

  def edit
    @template = Template.find(params[:id])
  end
  
  def update
    @template = Template.find(params[:id])
    if @template.update_attributes(params[:template])
      redirect_to templates_path
    else
      render templates_path
    end
  end

  def index   
    @templates = Template.all
  end

  def destroy
    @template = Template.find(params[:id])
    if @template.destroy
      redirect_to templates_path
    end
  end

  def use_template
    @template = Template.find(params[:id])
  end

  #  def send_mail
  #    @template = Template.find(params[:id])
  #    user= User.find_by_ic_number(params[:template][:user_id])
  #    if user.present?
  #      Stalker.enqueue("#{SPREFIX}.send.template",:user_id=>user.id, :user_email => user.email, :subject => @template.subject, :content => @template.content)
  #    end
  #    redirect_to templates_path
  #  end

  def send_mail
    @template = Template.find(params[:id])
    if params[:template][:type]=="All Users"
      users = User.active
    elsif params[:template][:type]=="All Dept Admins"
      users =  User.active.joins(:role_memberships).where("role_memberships.role_id=2")
    elsif params[:template][:type]=="Select Agency"
      if params[:template][:agency]!=nil
        departments = Department.active.joins(:agency).where(:agency_id=>params[:template][:agency]).collect(&:id)
        users = User.active.joins(:role_memberships).where("role_memberships.department_id in (?)", departments)
      else
        flash[:alert] = 'Please select Agency'
      end
    elsif params[:template][:type]=="Select Department"
      if params[:template][:agency]!=nil && params[:template][:department_id]!=nil
        department = Department.find_by_agency_id_and_id(params[:template][:agency], params[:template][:department_id])
        users = User.active.joins(:role_memberships).where("role_memberships.department_id = ?", department.id)
      else
        flash[:alert] = 'Please select Agency and Department'
      end
    elsif  params[:template][:type]=="Select Dept Admin"
      if params[:template][:user_id]!=nil
        users= User.where(:ic_number => params[:template][:user_id])
      else
        flash[:alert] = 'Please select User'
      end
    else
      flash[:alert] = 'Please select a user type'
    end
    if users && !users.empty?
      users.each do |user|
        begin
          Stalker.enqueue("#{SPREFIX}.send.template",:user_id=>user.id, :user_email =>
              user.email, :subject => @template.subject, :content => @template.content)
        rescue Exception=>e
          p "======Exception #{e.to_s}"
        end
      
      end
    end
    redirect_to templates_path
  end
  

end
