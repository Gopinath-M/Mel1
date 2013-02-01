class IctSystemAccess < ActiveRecord::Base
  mount_uploader :system_access_attachment, SystemAccessAttachmentUploader
  has_many :system_accesses
  belongs_to :requisition_type
  
  belongs_to :user

  validates :requisition_type_id, :system_access_id, :remarks, :presence => true
end