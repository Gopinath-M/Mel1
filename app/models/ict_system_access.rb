class IctSystemAccess < ActiveRecord::Base
  mount_uploader :system_access_attachment, SystemAccessAttachmentUploader
  has_many :system_accesses
  has_many :requisition_types
  
  belongs_to :user
end
