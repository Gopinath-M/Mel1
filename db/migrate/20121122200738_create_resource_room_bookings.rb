class CreateResourceRoomBookings < ActiveRecord::Migration
  def self.up
    create_table :resource_room_bookings do |t|
      t.integer :room_type_id
      t.integer :user_id
      t.string :requested_from_date
      t.string :requested_to_date
      t.integer :room_capacity
      t.string :purpose
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :resource_room_bookings
  end
end
