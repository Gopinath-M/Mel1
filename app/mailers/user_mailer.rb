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

  def intimate_user_assign(user,department)
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

  def ict_software(ict_email, software_installation_detail, software_installation, requisition_user)   
    @user = ict_email
    @software_installation_detail = software_installation_detail
    @requisition = software_installation
    @requisition_user = requisition_user
    @requisition.requisition_type_id
    @requisition_ict_software = RequisitionType.find_by_id(@requisition.requisition_type_id)
    mail(:to=>@user.email,:subject =>"#{@user.username}! has been forwarded request for ICT - #{@requisition_ict_software.name} Booking")
  end

  def send_status_mail_to_person_incharge_for_ict_software(ict_email, software_installation_detail, software_installation, person_incharge)
    @user = ict_email
    @software_installation_detail = software_installation_detail
    @requisition = software_installation
    @requisition_user = person_incharge
    @requisition_ict_software = RequisitionType.find_by_id(@requisition.requisition_type_id)
    mail(:to=>@requisition_user.email,:subject =>"#{@user.username}! has been forwarded request for ICT - #{@requisition_ict_software.name} Booking")
  end

  def send_mail_to_ict_vpn(ict_email, ict_vpn, requisition_ict_vpn, system_access_ict_vpn, requisition_user)
    @user = ict_email
    @ict_vpn = ict_vpn
    @requisition_ict_vpn = requisition_ict_vpn
    @system_access_ict_vpn = system_access_ict_vpn
    @requisition_user = requisition_user
    mail(:from=>@requisition_user.email,:to=>@user.email,:subject =>"#{@requisition_user.username}! has been requested for ICT - #{@requisition_ict_vpn.name} Booking")
  end

  def send_mail_to_ict_system_access(ict_email, ict_system_access, requisition_ict_system_access, system_access_ict_system_access, requisition_user)
    @user = ict_email
    @ict_system_access = ict_system_access
    @requisition_ict_system_access = requisition_ict_system_access
    @system_access_ict_system_access = system_access_ict_system_access
    @requisition_user = requisition_user
    mail(:from=>@requisition_user.email,:to=>@user.email,:subject =>"#{@requisition_user.username}! has been requested for ICT - #{@requisition_ict_system_access.name} Booking")
  end

  def send_mail_to_complaint_building_asset(ict_email, complaint_building_asset, category_name, type_name, item_name, requisition_user)
    @user = ict_email
    @complaint_building_asset = complaint_building_asset
    @category_name = category_name
    @type_name = type_name
    @item_name = item_name
    @requisition_user = requisition_user
    mail(:from=>@requisition_user.email,:to=>@user.email,:subject =>"#{@requisition_user.username}! has been complained request for Building Asset - #{@category_name.name}")
  end

  def send_mail_to_complaint_computer(ict_email, complaint_computer, name, system_access_name, system_model_name, requisition_user)
    @user = ict_email
    @complaint_computer = complaint_computer
    @name = name
    @system_access_name = system_access_name
    @system_model_name = system_model_name
    @requisition_user = requisition_user
    mail(:from=>@requisition_user.email,:to=>@user.email,:subject =>"#{@requisition_user.username}! has been complained request for Computers - #{@name.name}")
  end

  def send_mail_to_approver1(user,dept_admin,department)
    @user=user
    @dept_admin = dept_admin
    @department=department
    mail(:to=>@user.email,:subject =>" #{@dept_admin.username} has assigned you #{@user.username}! as a Approver First. ")
  end

  def send_mail_to_approver2(user1,dept_admin,department)
    @user=user1
    @dept_admin = dept_admin
    @department=department
    mail(:to=>@user.email,:subject =>" #{@dept_admin.username} has assigned you #{@user.username}! as a Approver Second.")
  end

  def send_update_mail_to_approver1(user,dept_admin,department)
    @user=user
    @dept_admin = dept_admin
    @department=department
    mail(:to=>@user.email,:subject =>" #{@dept_admin.username} has assigned you #{@user.username}! as a Approver First. ")
  end

  def send_update_mail_to_approver2(val,dept_admin,department)
    @user=val
    @dept_admin = dept_admin
    @department=department
    mail(:to=>@user.email,:subject =>" #{@dept_admin.username} has assigned you #{@user.username}! as a Approver Second. ")
  end

  def send_update_mail_to_approver2_temp(temp,dept_admin,department)
    @user=temp
    @dept_admin = dept_admin
    @department=department
    mail(:to=>@user.email,:subject =>" #{@dept_admin.username} has assigned you #{@user.username}! as a Approver Second. ")
  end

  def send_status_mail_for_ict_network(user,ordered_user,network)
    @user=user
    @ordered_user=ordered_user
    @requisition=network
    mail(:to=>@ordered_user.email,:subject =>" Resource Requisition for ICT network Point Requisition")
  end

  def send_status_mail_to_person_incharge_for_ict_network(user,ordered_user,network)
    @user=user
    @ordered_user=ordered_user
    @requisition=network
    mail(:to=>@user.email,:subject =>" Resource Requisition for ICT network Point Requisition")
  end

  def send_mail_to_dept_admin_for_ict_network(user,requisition,dept)
    @user=user
    @requisition=requisition
    @department=dept
    mail(:to=>@user.email,:subject =>" Details of ICT Network Point")
  end

  def send_mail_to_approver_for_ict_network(user,requisition,dept)
    @user=user
    @requisition=requisition
    @department=dept
    mail(:to=>@user.email,:subject =>" Details of ICT Network Point")
  end

  def send_mail_to_user_for_ict_network(ordered_user,requisition,dept)
    @user=ordered_user
    @requisition=requisition
    @department=dept
    mail(:to=>@user.email,:subject =>" Details of ICT Network Point")
  end


  #  ict_hardware

  #  ict_hardware
  def send_mail_to_dept_admin_for_ict_hardware(user, ict_hardware_booking, dept)
    @user=user
    @ict_hardware_booking=ict_hardware_booking
    @department=dept
    mail(:to=>@user.email,:subject =>" Details of ICT Hardware")
  end

  def send_status_mail_for_ict_hardware(user,ordered_user,ict_hardware,ict_hardware_booked_user)
    @user=user
    @ordered_user=ordered_user
    @ict_hardware_booking=ict_hardware
    @ict_hardware_booked_user=ict_hardware_booked_user
    mail(:to=>@user.email,:subject =>" Resource Requisition for ICT network Point Requisition",:bcc=>@ordered_user.email)
  end

  def send_mail_to_approver_for_ict_hardware(user, ict_hardware_booking, dept)
    @user=user
    @ict_hardware_booking=ict_hardware_booking
    @department=dept
    mail(:to=>@user.email,:subject =>" Details of ICT Network Point")
  end

  #ict_hardware end
  def send_mail_to_user_for_room_booking(ordered_user,resource_room_booking,dept)
    @user=ordered_user
    @requisition= resource_room_booking
    @department = dept
    mail(:to=>@user.email,:subject =>" Details of Resource Room Booking")
  end

  def send_mail_to_approver_for_room_booking(user,resource_room_booking,dept)
    @user=user
    @requisition= resource_room_booking
    @department = dept
    mail(:to=>@user.email,:subject =>" Details of Resource Room Booking")
  end

  def send_mail_to_dept_admin_for_room_booking(user,resource_room_booking,dept)
    @user=user
    @requisition= resource_room_booking
    @department = dept
    mail(:to=>@user.email,:subject =>" Details of Resource Room Booking")
  end

  def send_status_mail_ordered_user_for_room_booking(user,ordered_user,room)
    @user=user
    @ordered_user=ordered_user
    @requisition=room
    mail(:to=>@ordered_user.email,:subject =>" Resource Room Bookking Status Update")
  end

  def send_status_mail_resource_manager_for_room_booking(user,ordered_user,room)
    @user=user
    @ordered_user=ordered_user
    @requisition=room
    mail(:to=>@user.email,:subject =>" Resource Room Bookking Status Update")
  end

  def send_mail_to_approver_others_for_booking(user,resource_booking,dept)
    @user=user
    @requisition= resource_booking
    @department = dept
    mail(:to=>@user.email,:subject =>" Details of Others Resource Booking")
  end

  def send_mail_to_dept_admin_for_others_booking(user,resource_booking,dept)
    @user=user
    @requisition= resource_booking
    @department = dept
    mail(:to=>@user.email,:subject =>" Details of Others Resource Booking")
  end

  def send_mail_to_dept_admin_for_ict_software(user,requisition,software_installation,dept)
    @user=user
    @requisition=requisition
    @department=dept
    @software_installation = software_installation
    mail(:to=>@user.email,:subject =>" Details of ICT Software Installation")
  end

  def send_mail_to_approver_for_ict_software(user,requisition,software_installation,dept)
    @user=user
    @requisition=requisition
    @department=dept
    @software_installation = software_installation
    mail(:to=>@user.email,:subject =>"Details of ICT Software Installation")
  end

  def send_mail_to_user_for_ict_firewall(requester,user,ict_firewall,dept)
    @requester = requester
    @user=user
    @requisition=ict_firewall
    @department=dept
    mail(:to=>@user.email,:subject =>"ICT Firewall Request Details")
    mail(:to=>@requester.email,:subject =>"Details of your ICT Firewall Request")
  end

  def send_mail_to_user_for_ict_firewall_booking(user,ict_firewall)    
    @user=user
    @requisition=ict_firewall    
    mail(:to=>@user.email,:subject =>"ICT Firewall Request Details")    
  end

  def send_status_mail_for_others_booking(user,ordered_user,room)
    @user=user
    @ordered_user=ordered_user
    @requisition=room
    mail(:to=>@user.email,:subject =>"Others Resource Booking Status Update",:bcc=>@ordered_user.email)
  end

  def send_mail_to_approver_for_ict_equipment_booking(user,ict_equipment_booking,dept)
    @user=user
    @requisition= ict_equipment_booking
    @department = dept
    mail(:to=>@user.email,:subject =>"Details of Ict Equipment Booking")
  end

  def send_mail_to_dept_admin_for_ict_equipment_booking(user,ict_equipment_booking,dept)
    @user=user
    @requisition= ict_equipment_booking
    @department = dept
    mail(:to=>@user.email,:subject =>"Details of Ict Equipment  Booking")
  end

  def send_status_mail_for_ict_equipment_booking(user,ordered_user,ict_booking)
    @user=user
    @ordered_user=ordered_user
    @resource_ict_equipment_booking =ict_booking
    mail(:to=>@user.email,:subject =>"Ict Equipment Booking Update")
  end

  def timeline_expire_mail_to_approver(user)
    @user = user
    mail(:to=>@user.email,:subject =>"Timeline Expire Intimation")
  end

  def send_mail_to_dept_admin_for_transport_booking(user,resource_transport_booking,dept)
    @user=user
    @requisition= resource_transport_booking
    @department = dept
    mail(:to=>@user.email,:subject =>"Details of Resource Transport Booking")
  end

  def send_mail_to_user_for_transport_booking(user,resource_transport_booking)
    @user=user
    @requisition= resource_transport_booking
    mail(:to=>@user.email,:subject =>"Your Transport Booking Request was #{@requisition.status}")
  end

  def send_mail_to_resource_manager_for_transport_booking(user,resource_transport_booking)
    @user=user
    @requisition= resource_transport_booking
    mail(:to=>@user.email,:subject =>"You have received a Transport Booking Process Request")
  end

  def resource_booking_notification(user,booking,dept)
    @user=user
    @requisition= booking
    @department = dept
    mail(:to=>@user.email,:subject =>"Details of Ict Equipment Booking")
  end

  def room_auto_return_status_mail_to_user(mail)
    @requisition = mail
    @user = User.find_by_id(@requisition.user_id)
    mail(:to=>@user.email,:subject =>"Your Room Booking Request has been Auto Returned to Agency Store")
  end
  
  def send_mail_to_user_for_outstation_request(user,outstation)
    @outstation = outstation
    @user = user
    mail(:to=>@user.email,:subject=>"Your Outstation Request Details")
  end

  def newsletter(user_email,subject, content)
    @content = content
    mail(:to => user_email,:subject => subject)
  end

  def resource_ict_equipment_approval_request_officer_need_mail(user,resource_name)
    @user=user
    @resource_name = resource_name
    mail(:to=>@user.email,:subject =>"Resource ICT Equipment Approval Request Officer Need")
  end

end
