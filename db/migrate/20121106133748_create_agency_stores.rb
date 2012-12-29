class CreateAgencyStores < ActiveRecord::Migration
  def self.up
    create_table :agency_stores do |t|
      t.references :agency
      t.references :category
      t.references :sub_category
      t.references :driver
      t.string :resource_type
      t.references :resource
      t.integer :quantity, :default => 1
      t.integer :booked_quantity, :default => 0
      t.string :serial_no
      t.integer :uom
      t.boolean :booked,:default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :agency_stores
  end
end
