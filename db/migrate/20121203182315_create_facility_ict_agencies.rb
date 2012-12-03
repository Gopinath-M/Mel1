class CreateFacilityIctAgencies < ActiveRecord::Migration
  def self.up
    create_table :facility_ict_agencies do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :facility_ict_agencies
  end
end
