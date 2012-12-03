class CreateFacilityIctServers < ActiveRecord::Migration
  def self.up
    create_table :facility_ict_servers do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :facility_ict_servers
  end
end
