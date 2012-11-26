module MessagesHelper

  def create_messages(type,message)
    
    case type
      
    when 'All Users'
      message.message_type, message.agency_id, message.department_id, message.unit_id, message.send_to_dept_admins, message.send_to_unit_admins = 'Superadmin',0,0,0,0,0
    when 'All Dept Admins'
      message.message_type, message.agency_id, message.department_id, message.unit_id, message.send_to_dept_admins, message.send_to_unit_admins = 'AllDeptadmins',0,0,0,1,0
    when 'All Unit Admins'
      message.message_type, message.agency_id, message.department_id, message.unit_id, message.send_to_dept_admins, message.send_to_unit_admins = 'AllUnitadmins',0,0,0,0,1
    when 'Select Agency'
      message.message_type, message.agency_id, message.department_id, message.unit_id, message.send_to_dept_admins, message.send_to_unit_admins = 'Agency',params[:std][:agency],0,0,0,0
    when 'Select Department'
      message.message_type, message.agency_id, message.department_id, message.unit_id, message.send_to_dept_admins, message.send_to_unit_admins = 'Department',0,params[:std][:departments],0,0,0
    when 'Select Unit'
      message.message_type, message.agency_id, message.department_id, message.unit_id, message.send_to_dept_admins, message.send_to_unit_admins = 'Unit',0,0,params[:std][:units],0,0
    when 'Select Dept Admin'
      message.message_type, message.agency_id, message.department_id, message.unit_id, message.send_to_dept_admins, message.send_to_unit_admins = 'DeptAdmin',0,params[:std][:departments],0,1,0
    when 'Select Unit Admin'
      message.message_type, message.agency_id, message.department_id, message.unit_id, message.send_to_dept_admins, message.send_to_unit_admins = 'UnitAdmin',0,0,params[:std][:units],0,1
    when 'Department Admin Message'
      message.message_type, message.agency_id, message.department_id, message.unit_id, message.send_to_dept_admins, message.send_to_unit_admins = 'Department',0,params[:std][:departments],0,0,0
    end

    message.save
  end

  def collect_messages

    if !current_user.is_super_admin?
      dept_id = current_user.departments.collect(&:id).join(',')
      agency_id = current_user.departments.collect(&:agency_id).join(',')
      unit_id = current_user.units.collect(&:id).join(',')
    end

    case
    when current_user.is_super_admin?
      @messages = Message.where(:sender=>"#{current_user.id}",:deleted=>false).order("updated_at desc")
    when current_user.is_department_admin?
      @messages = Message.find(:all,:conditions=>["(deleted = false and ((agency_id = 0 and department_id = 0 and unit_id = 0 and send_to_unit_admins = false) || (department_id in (#{dept_id}) and message_type = 'Department' and send_to_dept_admins = false) || (department_id in (#{dept_id}) and message_type = 'DeptAdmin' and send_to_dept_admins = true) || (agency_id in (#{agency_id})) ))"],:order => "updated_at desc")
    when current_user.is_unit_admin?
      @messages = Message.find(:all,:conditions=>["(deleted = false and ((agency_id = 0 and department_id = 0 and unit_id = 0 and send_to_dept_admins = false) || (unit_id in (#{unit_id}) and message_type = 'Unit' and send_to_unit_admins = false) || (unit_id in (#{unit_id}) and message_type = 'UnitAdmin' and send_to_unit_admins = true) || (department_id in (#{dept_id}) and message_type = 'Department' and send_to_dept_admins = false and send_to_unit_admins = false) ||(agency_id in (#{agency_id})) ))"],:order => "updated_at desc")
    when current_user.is_department_user?
      @messages = Message.find(:all,:conditions=>["(deleted = false and ((agency_id = 0 and department_id = 0 and unit_id = 0 and send_to_dept_admins = false and send_to_unit_admins = false) || (unit_id in (#{unit_id}) and send_to_unit_admins = false) || (department_id in (#{dept_id}) and send_to_dept_admins = false) || (agency_id in (#{agency_id}) and send_to_dept_admins = false)))"],:order => "updated_at desc")
    end
  end
  
end