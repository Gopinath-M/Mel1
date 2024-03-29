class CreateFacilityIctHardwares < ActiveRecord::Migration
  def self.up
    create_table :facility_ict_hardwares do |t|
      t.string :name
      t.string :hardware_type
      t.boolean :is_active, :default => false
      t.boolean :deleted, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :facility_ict_hardwares
  end
end
