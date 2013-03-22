class ResourceRoomBooking < ActiveRecord::Base
  has_many :remarks, :as=>:remarkable
  attr_accessor :notes
  belongs_to :sub_category
  belongs_to :resource
  belongs_to :agency_store
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :department
  belongs_to :user , :class_name => "User", :foreign_key => "updated_by"
  after_create :add_remarks
  after_update :add_remarks
  
#  validate :add_remarks, :on => :save
#  validate :add_remarks, :on => :update

  def add_remarks
    Remark.create(:user_id=>self.updated_by.nil? ? self.user_id : self.updated_by, :department_id=>Department.current_department, :remarkable_id=>self.id, :remarkable_type=>self.class,:text=>self.notes)
  end
  
  validates :purpose,:requested_from_date,:requested_to_date,:sub_category_id,:room_capacity, :presence => true
  validate :validate_booking_time, :on=>:create

  def validate_booking_time
    errors.add(:base,(I18n.translate!('errors_date.date_greater'))) if self.requested_from_date!=nil && self.requested_from_date<Time.now
    errors.add(:base,(I18n.translate!('errors_date.from_date_greater'))) if self.requested_to_date!=nil && self.requested_to_date<Time.now
    errors.add(:base,(I18n.translate!('errors_date.to_date_greater'))) if self.requested_from_date!=nil && self.requested_to_date!=nil && self.requested_from_date>self.requested_to_date
  end

  mount_uploader :room_attachment, RoomAttachmentUploader

  def self.auto_return    
    @room = ResourceRoomBooking.all
    time = Time.now
    @room.each do |mail|
      if time > mail.requested_to_date
        mail.update_attribute(:status, "Returned")
        if mail.user_notification_mail == false
          UserMailer.room_auto_return_status_mail_to_user(mail).deliver
        end
        mail.update_attribute(:user_notification_mail,true)
      end
    end
  end


end
