class CreateResourceIctEquipmentBookings < ActiveRecord::Migration
  def self.up
    create_table :resource_ict_equipment_bookings do |t|
      t.references :equipment_category
      t.text :purpose
      t.text :location
      t.datetime :requested_from_date
      t.datetime :requested_to_date
      t.boolean :need_officer, :default => false
      t.references :user
      t.references :officer
      t.references :approver
      t.datetime :meeting_start_time
      t.datetime :meeting_end_time
      t.text :notes
      t.string :status, :default => "New"
      t.timestamps
    end
  end

  def self.down
    drop_table :resource_ict_equipment_bookings
  end
end
