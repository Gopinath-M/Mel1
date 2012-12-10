class SystemAccess < ActiveRecord::Base
  belongs_to :ict_vpns
  belongs_to :ict_system_accesses
end
