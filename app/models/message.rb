class Message < ActiveRecord::Base
  has_many :message_comments
  belongs_to :user, :foreign_key => 'sender'
  #validates :message, :presence => true
  attr_accessible :type,:sender,:message,:agency_id,:department_id,:attachment,:unit_id
  mount_uploader :attachment, AttachmentUploader
  
  #before_save :update_attachment_attributes
  
  private
  
  def update_attachment_attributes
    if message.present? && message_changed?
      self.content_type = message.attachment.content_type
      self.file_size = message.attachment.size
    end
  end
  
end
