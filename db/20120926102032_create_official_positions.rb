class CreateOfficialPositions < ActiveRecord::Migration
  def self.up
    create_table :official_positions do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :official_positions
  end
end
