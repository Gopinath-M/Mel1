class CreateVehicles < ActiveRecord::Migration
  def self.up
    create_table :vehicles do |t|
      t.integer :registration_id
      t.string :registration_number
      t.references :vehicle_type
      t.references :driver
      t.string :model
      t.string :registration_date
      t.timestamps
    end
  end

  def self.down
    drop_table :vehicles
  end
end
