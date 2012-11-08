class CreateResourceBookings < ActiveRecord::Migration
  def self.up
    create_table :resource_bookings do |t|
      t.string :name
      t.references :user
      t.references :department
      t.references :resource
      t.string :attachment
      t.string :purpose
      t.string :description
      t.integer :quantity
      t.datetime :requested_from_date
      t.datetime :requested_to_date
      t.datetime :request_processed_date
      t.datetime :return_date
      t.string :status
      t.boolean :priority_booking, :default=>false
      t.integer :created_by
      t.timestamps
    end
  end

  def self.down
    drop_table :resource_bookings
  end
end
