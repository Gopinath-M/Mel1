class CreateResourceTransportationBookings < ActiveRecord::Migration
  def self.up
    create_table :resource_transportation_bookings do |t|
      t.text :purpose
      t.string :state
      t.string :city
      t.text :location
      t.integer :number_of_passengers
      t.string :pick_up_place
      t.references :transport_store
      t.references :vehicle_type
      t.references :driver
      t.text :remarks
      t.datetime :requested_from_date
      t.datetime :requested_to_date
      t.datetime :request_processed_date
      t.datetime :return_date
      t.string :requester_id
      t.string :transport_avatar
      t.string :status
      t.string :approver_id
      t.boolean :send_sms_to_driver,:default=> false
      t.timestamps
    end
  end

  def self.down
    drop_table :resource_transportation_bookings
  end
end
