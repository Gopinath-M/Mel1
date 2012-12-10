class IctVpn < ActiveRecord::Base
  validates :from_date, :presence => true
  validates :to_date, :presence => true

  has_many :system_accesses
  has_many :requisition_types
  belongs_to :user


    mount_uploader :vpn_attachment, VpnAttachmentUploader
end
