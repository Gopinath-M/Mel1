class ComplaintBuildingAsset < ActiveRecord::Base
  belongs_to :user
   validates_inclusion_of :repair_action, :in => [true, false]
   validates_inclusion_of :spare_part_action, :in => [true, false]
   validates :building_asset_type_id, :damage_type_id, :item_id, :location, :serial_no, :reason, :presence => true
end
