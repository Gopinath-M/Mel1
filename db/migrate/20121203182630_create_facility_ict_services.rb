class CreateFacilityIctServices < ActiveRecord::Migration
  def self.up
    create_table :facility_ict_services do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :facility_ict_services
  end
end
