class UserMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def welcomemail_department_user(user,password)
   begin
    @user=user
    @password=password
    mail(:to=>@user.email,:subject =>"Welcome to Melaka")
   rescue Exception=>e
   end
  end
  # Transfer Dept email to user
  def intimate_user(user,department)
    @user=user
    @department=department
    mail(:to=>@user.email,:subject =>"Transfer User to Department")
  end

  def activation_mail_to_department_admin(user)
        @user=user
    mail(:to=>@user.email,:subject =>"#{@user.full_name}! Your Account has been Activated Successfully ")
  end
  #Chat invitation
  def welcomemail_chat_user(emailchecking,resource_user)
    @user=emailchecking
    @resource_user = resource_user
    mail(:from=>@resource_user.email,:to=>@user.email,:subject =>"#{@resource_user.username}! has been sent request to join for chat ")
  end

 
 def ict_software(ict_email, ict_vpn, requisition_ict_software, requisition_user)
    @user = ict_email
    @ict_vpn = ict_vpn
    @requisition_ict_vpn = requisition_ict_software
    @requisition_user = requisition_user
    mail(:from=>@requisition_user.email,:to=>@user.email,:subject =>"#{@requisition_user.username}! has been forwarded request for ICT - #{@requisition_ict_vpn.name} Booking")
  end

 def ict_vpn(ict_email, ict_vpn, requisition_ict_vpn, system_access_ict_vpn, requisition_user)
    @user = ict_email
    @ict_vpn = ict_vpn
    @requisition_ict_vpn = requisition_ict_vpn
    @system_access_ict_vpn = system_access_ict_vpn
    @requisition_user = requisition_user
    mail(:from=>@requisition_user.email,:to=>@user.email,:subject =>"#{@requisition_user.username}! has been forwarded request for ICT - #{@requisition_ict_vpn.name} Booking")
  end

  def ict_system_access(ict_email, ict_system_access, requisition_ict_system_access, system_access_ict_system_access, requisition_user)
    @user = ict_email
    @ict_system_access = ict_system_access
    @requisition_ict_system_access = requisition_ict_system_access
    @system_access_ict_system_access = system_access_ict_system_access
    @requisition_user = requisition_user
    mail(:from=>@requisition_user.email,:to=>@user.email,:subject =>"#{@requisition_user.username}! has been forwarded request for ICT - #{@requisition_ict_system_access.name} Booking")
  end

  def complaint_building_asset(ict_email, complaint_building_asset, name, demage_name, item_name, requisition_user)
    @user = ict_email
    @complaint_building_asset = complaint_building_asset
    @name = name
    @demage_name = demage_name
    @item_name = item_name
    @requisition_user = requisition_user
    mail(:from=>@requisition_user.email,:to=>@user.email,:subject =>"#{@requisition_user.username}! has been forwarded complained request for Building Asset - #{@name.name}")
  end

  def complaint_computer(ict_email, complaint_computer, name, system_access_name, system_model_name, requisition_user)
    @user = ict_email
    @complaint_computer = complaint_computer
    @name = name
    @system_access_name = system_access_name
    @system_model_name = system_model_name
    @requisition_user = requisition_user
    mail(:from=>@requisition_user.email,:to=>@user.email,:subject =>"#{@requisition_user.username}! has been forwarded complained request for Computers - #{@name.name}")
  end
end
