class CreateFacilityIctHardwares < ActiveRecord::Migration
  def self.up
    create_table :facility_ict_hardwares do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :facility_ict_hardwares
  end
end
