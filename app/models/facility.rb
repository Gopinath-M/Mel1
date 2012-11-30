class Facility < ActiveRecord::Base
  validates :resource_type, :presence => true
#  validates :sub_category_id, :presence => true
  validates :name, :presence => true
  validates :total_qty, :presence => true
end
