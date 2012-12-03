class CreateFacilityIctWirings < ActiveRecord::Migration
  def self.up
    create_table :facility_ict_wirings do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :facility_ict_wirings
  end
end
