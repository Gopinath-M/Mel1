class AddFieldsToExistTables < ActiveRecord::Migration
  def self.up
    change_column  :groups , :department_id ,:integer
    change_column  :group_members , :user_id ,:integer
    add_column  :resource_ict_equipment_bookings , :ict_equipment_attachment ,:string
    add_column  :ict_hardware_bookings , :ict_hardware_attachment ,:string
  end

  def self.down
    remove_column  :resource_ict_equipment_bookings , :ict_equipment_attachment
    remove_column  :ict_hardware_bookings , :ict_hardware_attachment
  end
end
