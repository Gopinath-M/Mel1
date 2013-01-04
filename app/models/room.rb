class Room < ActiveRecord::Base
   validates :name, :presence => true
   validates :location, :presenceence => true
   validates :extension_no, :presence => true
end
