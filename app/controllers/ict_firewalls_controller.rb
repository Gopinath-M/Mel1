class IctFirewallsController < ApplicationController
  before_filter :authenticate_user!
  include IctFirewallsHelper

  def index
    #@ict_firewalls = IctFirewall.all
    #if current_user.is_resource_manager?
    #   @ict_firewalls = IctFirewall.find(:all, :conditions => ["status != 'New'"])
    #elsif current_user.is_department_admin?
    #   @ict_firewalls = IctFirewall.where(:department_id => current_user.departments)
    #else
    #   @ict_firewalls = IctFirewall.find(:all,:conditions=>["user_id = ? or incharge_person = ?",current_user.id,current_user.id])
    #end
    @ict_firewalls = IctFirewall.where(:user_id => current_user.id,:department_id => @current_department).order.page(params[:page]).per(4)
  end

  def add_select_boxes
    @val = params[:incre]
  end

  def new
    @ict_firewall = IctFirewall.new
  end

  def create
    @ict_firewall = IctFirewall.new(params[:ict_firewall])
    @ict_firewall.user_id = current_user.id
    @ict_firewall.source_ip = params[:s1]+'.'+params[:s2]+'.'+params[:s3]+'.'+params[:s4]
    @ict_firewall.destination_ip = params[:d1]+'.'+params[:d2]+'.'+params[:d3]+'.'+params[:d4]
    @ict_firewall.status = 'New'
    @ict_firewall.department_id = params[:department_id]
    @ict_firewall.requisition_type_id = '2'
    @ict_firewall.requested_from_date = params[:ict_firewall][:requested_from_date].to_datetime
    @ict_firewall.requested_to_date = params[:ict_firewall][:requested_to_date].to_datetime
      
    if @ict_firewall.valid?
      @ict_firewall.save
      ict_firewall = @ict_firewall
      if params[:ict_facility_service][:id] != ''
        if params[:one_way] == 'one_way'
          t = true
        else
          t = false
        end
        @ict_facility = IctFirewallService.create(:ict_firewall_id => @ict_firewall.id,:facility_ict_service_id => params[:ict_facility_service][:id],:one_way=>t)

        n = params[:total_service_count].to_i if params[:total_service_count] != '0'

        if !n.blank?
          for i in 1..n
            if params[:"one_way_#{i}"] == 'one_way'
              t = true
            else
              t = false
            end
            @ict_facility = IctFirewallService.create(:ict_firewall_id=>@ict_firewall.id,:facility_ict_service_id => params[:ict_facility_service][:"#{i}"],:one_way=>t)
          end
        end
      end
        
      @approver_first = Approver.active.find_all_by_department_id(@current_department).first
      @approver_second = Approver.active.find_all_by_department_id(@current_department).last
        
      dept = Department.find_by_id(@current_department)
      if @approver_first.present?
        user = User.find_by_id(@approver_first.user_id)
        UserMailer.send_mail_to_user_for_ict_firewall(current_user,user,ict_firewall,dept).deliver
      elsif @approver_second.present?
        user = User.find_by_id(@approver_second.user_id)
        UserMailer.send_mail_to_user_for_ict_firewall(current_user,user,ict_firewall,dept).deliver
      else
        user = dept.users.where("role_id = 2").first
        UserMailer.send_mail_to_user_for_ict_firewall(current_user,user,ict_firewall,dept).deliver
      end
         
      #@approve = Approver.active.find_all_by_department_id(current_user.departments).first
      #dept = Department.find_by_id(current_user.departments)
      #if !@approve.present?
      #  user = dept.users.where("role_id = 2").first
      #  UserMailer.send_mail_to_user_for_ict_firewall(current_user,user,ict_firewall,dept).deliver
      #else
      #  user = User.find_by_id(@approve.user_id)
      #  UserMailer.send_mail_to_user_for_ict_firewall(current_user,user,ict_firewall,dept).deliver
      #end
    
      redirect_to(ict_firewalls_path, :notice => "Resource Requisition ICT Firewall has been created successfully.")
    else
      render :action=>'new'
    end
  end

  def update
    @ict_firewall = IctFirewall.find(params[:id])
    if @ict_firewall.status == "New"
      #if params[:ict_firewall][:status].to_s == 'Approve'
      if params[:approve_status].to_s == 'Approve'
        t = true
      else
        t = false
      end
    end

    if @ict_firewall.status == 'New'
      ict_firewall = @ict_firewall
      @ict_firewall.update_attributes(:remarks=>params[:remarks],:status=>params[:approve_status],
        :incharge_person => params[:forward][:to])
         
    @count = IctFirewallService.find_all_by_ict_firewall_id(@ict_firewall.id)
           
    @count.each_with_index do |count,index|
      if params[:"status_#{count.id}"].to_s == 'Approve'
        t = true
      else
        t = false
      end
      count.update_attribute(:approved,t)
    end
    
      #UserMailer.send_mail_to_user_for_ict_firewall(current_user,user,ict_firewall).deliver
    else
      @ict_firewall.update_attributes(:status=> params[:approve_status])
    end
          
    #@ict_firewall_service = IctFirewallService.find_by_ict_firewall_id(params[:id])
    #@ict_firewall_service.update_attribute(:approved,t)
      
    redirect_to(list_ict_firewall_ict_firewalls_path, :notice => "Resource Requisition ICT Firewall has been updated successfully.")
  end

  def destroy

  end

  def show
    @ict_firewall = IctFirewall.find(params[:id])
  end

  def edit
    @ict_firewall = IctFirewall.find(params[:id])
    @dept = Department.find(default_department)
    @users = @dept.users
  end

  def list_ict_firewall
    @first_approver = Approver.active.find_all_by_department_id(@current_department).first
    @second_approver = Approver.active.find_all_by_department_id(@current_department).last
    if !@first_approver.present? && !@second_approver.present?
      @ict_firewalls = IctFirewall.where(:department_id => @current_department).order.page(params[:page]).per(4)
    else
      @ict_firewalls = IctFirewall.where(:incharge_person => current_user.id).order.page(params[:page]).per(4)
    end
    if @first_approver.present?
      @ict_firewalls = IctFirewall.where(:department_id => @first_approver.department_id).order.page(params[:page]).per(4)      
    end
  end

  def download_attachments
    @message = IctFirewall.find(params[:id])
    send_file @message.attachment.path
  end

  def list_requisition_firewall
    if params[:ic_number].present?
      users = User.find_by_ic_number(params[:ic_number])
      @ict_firewalls = IctFirewall.where(:user_id => users.id).order.page(params[:page]).per(5)
    else
      @ict_firewalls = IctFirewall.order.page(params[:page]).per(5)
    end
    if request.xhr?
      render :layout=>false
    end
  end

end
