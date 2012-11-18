class CreateAgencyStores < ActiveRecord::Migration
  def self.up
    create_table :agency_stores do |t|
      t.references :agency
      t.references :department
      t.references :resources
      t.integer :quantity
      t.text :serial_no
      t.integer :uom
      t.boolean :is_active, :default => true
      t.boolean :deleted, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :agency_stores
  end
end
