class CreateAgencyStores < ActiveRecord::Migration
  def self.up
    create_table :agency_stores do |t|
      t.references :agency
      t.references :category
      t.references :sub_category
      t.string :resource_type
      t.references :resource
      t.boolean :booked,:default=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :agency_stores
  end
end
