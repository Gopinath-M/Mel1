class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new

    if user.is_super_admin?
      can :manage, :all

    elsif user.is_department_admin?
      can [:read,:create], User
      can :create, Approver
      can [:read,:create,:show,:approve_request,:request_view,:get_vehicles,:get_driver_details,:change_resource_status], ResourceTransportationBooking
      can [:read,:create,:show,:list_resource_booking,:room_booking_approval],ResourceRoomBooking
      can [:read,:create,:show,:approve_request,:requests],ResourceIctEquipmentBooking
      can [:read,:create,:show,:list_resource_booking,:resource_booking_approval],ResourceBooking
      can [:read,:update,:list_ict_firewall],IctFirewall
      can [:read,:update,:approve_request,:approve_request_for_state],Outstation

    elsif user.is_department_user?

      can [:read,:create,:show], ResourceTransportationBooking
      can [:read,:create,:show], ResourceRoomBooking
      can [:read,:create,:show], ResourceIctEquipmentBooking
      can [:read,:create,:show], ResourceBooking
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

      can [:read,:create,:show,:approve_request,:request_view,:get_vehicles,:get_driver_details,:change_resource_status], ResourceTransportationBooking

    elsif ( user.is_datuk_suk? || user.is_suk_deputy? || user.is_chief_minister? || user.is_human_resource_manager? )

      can [:read,:update,:approve_request,:approve_request_for_state], Outstation

    end
  end

end