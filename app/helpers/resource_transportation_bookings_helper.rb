module ResourceTransportationBookingsHelper

  # This method is for status 'Approved' alone
  def approve_scenario(id,vehicle_id)

    rtb = ResourceTransportationBooking.find(id)
    agency_store = AgencyStore.find_by_resource_id(vehicle_id)
    driver = Driver.find(agency_store.driver_id)
    #vehicle = Vehicle.find(vehicle_id)
    #driver = Driver.find(vehicle.driver_id)
      
    rtb.update_attributes(:status=>'Approved',:agency_store_id => agency_store.id,:driver_id => driver.id)
    agency_store.update_attribute(:booked,true)
    driver.update_attribute(:already_assigned,true)

    disable_the_sub_category_when_that_sub_category_is_fully_reserved(agency_store.sub_category_id)
      
  end

  # This method is for status 'Returned' alone
  def return_scenario(id)

    rtb = ResourceTransportationBooking.find(id)
    agency_store = AgencyStore.find_by_resource_id(rtb.agency_store_id)    
    driver = Driver.find(rtb.driver_id)

    #    vehicle = Vehicle.find(agency_store.resource_id)
    #    if vehicle.alternate_driver_assigned?
    #      driver = Driver.find(vehicle.alternate_driver_id)
    #      vehicle.update_attributes(:alternate_driver_assigned=>false,:alternate_driver_id=>nil)
    #    else
    #      driver = Driver.find(vehicle.driver_id)
    #    end

    rtb.update_attribute(:status,'Returned')
    agency_store.update_attribute(:booked,false)
    #driver.update_attribute(:already_assigned,false)

    disable_the_sub_category_when_that_sub_category_is_fully_reserved(agency_store.sub_category_id)
  end

  def get_booking_records
    if current_user && current_user.is_super_admin?
      @resource_transportation_bookings = ResourceTransportationBooking.all
    elsif current_user && current_user.is_resource_manager?
      @resource_transportation_bookings = ResourceTransportationBooking.find(:all,:conditions=>["status = 'Approved' or status = 'Processed' or status = 'Returned' "])
    else
      @resource_transportation_bookings = ResourceTransportationBooking.find(:all,:conditions=>[("requester_id = '#{current_user.id}'")])
    end
  end

  def process_scenario_alternate_driver(id,vehicle_id)
    
    rtb = ResourceTransportationBooking.find(id)
    as = AgencyStore.find(rtb.agency_store_id)
    as1 = AgencyStore.find_by_resource_id(vehicle_id)
    
    #driver = Driver.find_by_name(driver_name)
    #as = AgencyStore.find(rtb.agency_store.resource_id)
    #vehicle_driver = Driver.find(as.driver_id)

   
    rtb.update_attributes(:status=>'Processed', :agency_store_id => as1.id , :driver_id => as1.driver_id )
    as.update_attribute(:booked,false)
    as1.update_attribute(:booked,true)
    
    #vehicle.update_attributes(:alternate_driver_assigned=>true,:alternate_driver_id => driver.id)
    #vehicle_driver.update_attribute(:already_assigned,false)
    #driver.update_attribute(:already_assigned,true)

   # disable_the_sub_category_when_that_sub_category_is_fully_reserved(id)
    
  end

  def decline_scenario(id)
    rtb = ResourceTransportationBooking.find(id)
    as = AgencyStore.find(rtb.agency_store_id)
    as.update_attribute(:booked,false)
    disable_the_sub_category_when_that_sub_category_is_fully_reserved(rtb.sub_category_id)
  end
  
  def disable_the_sub_category_when_that_sub_category_is_fully_reserved(id)
    ag = AgencyStore.find(:all,:conditions=>["booked = false and sub_category_id = ?",id])
    sc = SubCategory.find(id)
    if ag.count > 0      
      sc.update_attribute(:is_available,true)
    else
      sc.update_attribute(:is_available,false)
    end
  end 
end
