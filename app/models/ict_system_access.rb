class IctSystemAccess < ActiveRecord::Base
  mount_uploader :system_access_attachment, SystemAccessAttachmentUploader
end
