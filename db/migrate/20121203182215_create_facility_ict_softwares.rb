class CreateFacilityIctSoftwares < ActiveRecord::Migration
  def self.up
    create_table :facility_ict_softwares do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :facility_ict_softwares
  end
end
