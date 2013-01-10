class ComplaintComputer < ActiveRecord::Base
  belongs_to :user
  validates :complaint_type_id, :system_access_id, :system_model_type_id, :serial_no, :reason, :presence => true
  validates :serial_no, :numericality => { :only_integer => true }
end
