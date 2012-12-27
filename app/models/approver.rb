class Approver < ActiveRecord::Base
  belongs_to :user
  scope :active, where(:is_active=>true)
end
