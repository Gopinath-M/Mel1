class CreateResourceIctBookings < ActiveRecord::Migration
  def self.up
    create_table :resource_ict_bookings do |t|
      t.string :type
      t.text :purpose
      t.string :location
      t.datetime :booking_date
      t.datetime :return_date
      t.boolean :need_officer, :default => false
      t.integer :officer_id
      t.text :remarks
      t.timestamps
    end
  end

  def self.down
    drop_table :resource_ict_bookings
  end
end
