class AddFieldsToExistTables < ActiveRecord::Migration
  def self.up
    add_column  :message_comments, :deleted, :boolean, :default => false
    add_column  :facility_ict_hardwares, :hardware_type, :string
    add_column  :facility_ict_wirings, :facility_hardware_id, :integer
  end

  def self.down
    remove_column  :message_comments, :deleted
    remove_column  :facility_ict_hardwares, :hardware_type
    remove_column  :facility_ict_wirings, :facility_hardware_id
  end
end
