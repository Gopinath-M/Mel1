class IctFirewallsController < ApplicationController
  before_filter :authenticate_user!
  include IctFirewallsHelper
  
  def index
    #@ict_firewalls = IctFirewall.all
    if current_user.is_resource_manager? 
      @ict_firewalls = IctFirewall.find(:all, :conditions => ["status != 'New'"])
    elsif current_user.is_department_admin?
      @ict_firewalls = IctFirewall.all
    else
      @ict_firewalls = IctFirewall.find(:all,:conditions=>["user_id = ? or incharge_person = ?",current_user.id,current_user.id])
    end
  end


  def new
    @ict_firewall = IctFirewall.new
  end

  def create
    @ict_firewall = IctFirewall.create(params[:ict_firewall])
    @ict_firewall.user_id = current_user.id
    @ict_firewall.source_ip = params[:s1]+'.'+params[:s2]+'.'+params[:s3]+'.'+params[:s4]
    @ict_firewall.destination_ip = params[:d1]+'.'+params[:d2]+'.'+params[:d3]+'.'+params[:d4]    
    @ict_firewall.status = 'New'
    @ict_firewall.requisition_type_id = '2'
    @ict_firewall.requested_from_date = params[:ict_firewall][:requested_from_date].to_datetime
    @ict_firewall.requested_to_date = params[:ict_firewall][:requested_to_date].to_datetime

    if @ict_firewall.valid?
      @ict_firewall.save
      if params[:ict_facility_service][:id] != ''
        if params[:one_way] == 'one_way'
          t = true
        else
          t = false
        end
        @ict_facility = IctFirewallService.create(:ict_firewall_id=>@ict_firewall.id,:facility_ict_service_id => params[:ict_facility_service][:id],:one_way=>t)
      end
      redirect_to(ict_firewalls_path, :notice => "Resource Requisition ICT Firewall has been created successfully.")
    else
      render :action=>'new'
    end
  end

  def update
    @ict_firewall = IctFirewall.find(params[:id])
  
    if params[:ict_firewall][:status].to_s == 'Approve'
      t = true
    else
      t = false
    end
  
    if @ict_firewall.status == 'New'
      @ict_firewall.update_attributes(:remarks => params[:remarks],
        :status => params[:approve_status],
        :incharge_person => params[:forward][:to])
    end
    @ict_firewall.update_attributes(:status=> params[:approve_status])

    @ict_firewall_service = IctFirewallService.find_by_ict_firewall_id(params[:id])
    @ict_firewall_service.update_attribute(:approved,t)

    redirect_to(ict_firewalls_path, :notice => "Resource Requisition ICT Firewall has been updated successfully.")
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

  def approve_request
    @ict_firewall = IctFirewall.find(params[:id])
  end

  def change_request_status
    
  end

end
