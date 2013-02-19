class Ability < ActiveRecord::Base
  cattr_accessor :current_department
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new
    
    if user.is_super_admin?
      can :manage, :all
      #cannot :manage, [GroupMember, ComplaintComputer, ComplaintBuildingAsset]

    elsif user.is_department_admin?
      can [:read,:create], User
      can :create, Approver
      #can [:read,:create,:show,:approve_request,:request_view,:get_vehicles,:get_driver_details,:change_resource_status], ResourceTransportationBooking
      #can [:read,:create,:show,:list_resource_booking,:room_booking_approval],ResourceRoomBooking
      #can [:read,:create,:show,:approve_request,:requests],ResourceIctEquipmentBooking
      #can [:read,:create,:show,:list_resource_booking,:resource_booking_approval],ResourceBooking
      #can [:read,:update,:list_ict_firewall],IctFirewall
      #can [:read,:update,:approve_request,:approve_request_for_state],Outstation
      can [:manage], [ResourceTransportationBooking,ResourceRoomBooking,ResourceIctEquipmentBooking,ResourceBooking,IctFirewall,IctNetworkPoint,IctHardwareBooking,IctSystemAccess,IctVpn,SoftwareInstallation,Outstation]

    elsif user.is_department_user?
      
      #Thread.current[:department]
      
      @approver_first = Approver.active.find_all_by_user_id_and_department_id(user.id,Thread.current[:department]).first
      @approver_second = Approver.active.find_all_by_user_id_and_department_id(user.id,Thread.current[:department]).last
      
      if ( @approver_first.present? || @approver_second.present? )
        can [:manage], [ResourceTransportationBooking,ResourceRoomBooking,ResourceIctEquipmentBooking,ResourceBooking,IctFirewall,IctNetworkPoint,IctHardwareBooking,IctSystemAccess,IctVpn,SoftwareInstallation]        
      end
            
      can [:read,:create,:show,:user_return_status], ResourceTransportationBooking
      can [:read,:create,:show,:user_return,:get_list_of_facility,:get_resources,:get_details_for_resource,:list_resource_booking], ResourceRoomBooking
      can [:read,:create,:show,:download_attachments,:get_value_of_resource,:requests], ResourceIctEquipmentBooking
      can [:read,:create,:show,:get_other_sub_categories,:get_value_of_resource,:list_resource_booking], ResourceBooking
      can [:read,:create,:show], IctFirewall
      can [:read,:create,:show], IctNetworkPoint
      can [:read,:create,:show], IctVpn
      can [:read,:create,:show], IctSystemAccess
      can [:read,:create,:show], IctHardwareBooking
      can [:read,:create,:show], SoftwareInstallation
      can [:read,:create,:show], Outstation
      can [:read,:create,:show], ComplaintBuildingAsset
      can [:read,:create,:show], ComplaintComputer
      
    elsif user.is_resource_manager?

      #can [:read,:create,:show,:approve_request,:request_view,:get_vehicles,:get_driver_details,:change_resource_status], ResourceTransportationBooking
      can [:manage], [ResourceTransportationBooking,ResourceRoomBooking,ResourceIctEquipmentBooking,ResourceBooking]
      
    elsif ( user.is_datuk_suk? || user.is_suk_deputy? || user.is_chief_minister? || user.is_human_resource_manager? )

      can [:manage], Outstation

    end
  end

end