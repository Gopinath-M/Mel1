class CreateAgencyStores < ActiveRecord::Migration
  def self.up
    create_table :agency_stores do |t|
      t.references :agency
      t.references :department
      t.text :resources
      t.string :resource_type
      t.references :vehicle_type
      t.references :vehicle
      t.integer :quantity
      t.text :serial_no
      t.integer :uom
      t.boolean :booked
      t.timestamps
    end
  end

  def self.down
    drop_table :agency_stores
  end
end
