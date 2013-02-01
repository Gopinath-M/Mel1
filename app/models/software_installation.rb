class SoftwareInstallation < ActiveRecord::Base
  has_many :software_installation_details
  accepts_nested_attributes_for :software_installation_details
   mount_uploader :software_attachment, SoftwareAttachmentUploader
end
