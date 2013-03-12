class Outstation < ActiveRecord::Base
  mount_uploader :attachment, OutstationAttachmentUploader
  
  attr_accessible :user_id,:is_out_of_state,:is_official,:placename,:from_date,:to_date,:state,:country,:purpose,:total_expenditure,:cause_spending,:attachment,:status

  validates :placename,:from_date,:to_date,:purpose, :presence => true

  validate :state_present_or_not
  after_save :mail_to_user_regarding_outstation_details
  after_update :mail_to_user_regarding_outstation_details
  validate :validate_end_date_before_start_date
  validate :validate_start_date

  def validate_end_date_before_start_date
    if self.from_date.present? && self.to_date.present?
      errors.add(:Error,(I18n.translate!('errors_date.outstation_date_less'))) if self.from_date > self.to_date
    end
  end

  def validate_start_date
    if self.from_date.present?
      errors.add(:Error,(I18n.translate!('errors_date.outstation_date_not_less'))) if self.from_date.to_date < Date.today
    end
  end

  def state_present_or_not
    if self.is_out_of_state?
      errors.add(:Error,(I18n.translate!('errors_date.state_blank'))) if self.state == ''
    end
  end
  
   def mail_to_user_regarding_outstation_details
    user = User.find(self.user_id)
    UserMailer.send_mail_to_user_for_outstation_request(user,self).deliver
  end
end
