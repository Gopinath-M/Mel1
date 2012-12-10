class CreateBuildingAssetTypes < ActiveRecord::Migration
  def self.up
    create_table :building_asset_types do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :building_asset_types
  end
end
