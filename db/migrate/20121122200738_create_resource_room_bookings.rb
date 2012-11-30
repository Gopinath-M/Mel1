class CreateResourceRoomBookings < ActiveRecord::Migration
  def self.up
    create_table :resource_room_bookings do |t|
      t.integer :sub_category_id
      t.integer :resource_id
      t.integer :agency_store_id
      t.integer :user_id
      t.integer :department_id
      t.string :requested_from_date
      t.string :requested_to_date
      t.boolean :user_returned_status
      t.integer :room_capacity
      t.string :purpose
      t.text :remarks
      t.string :room_attachment
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :resource_room_bookings
  end
end
