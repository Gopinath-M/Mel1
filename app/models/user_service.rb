class UserService < ActiveRecord::Base

  attr_accessible :service_level_id,:classification_id,:grade_id,:service_standard_id,:appointment_id,:salary_scale1,:salary_scale2,:email,:position,:office_address,:office_number,:office_fax,:postal_code,:city,:state,:recent_salary,:user_id,:first_appointment_to_public_service,:first_appointment_to_present_position,:promotion_to_present_grade,:confirmation_date

  validates :service_level_id,:classification_id,:grade_id,:service_standard_id,:appointment_id,:salary_scale1,:salary_scale2,:office_address,:office_number,:office_fax,:postal_code,:city,:state,:recent_salary,:first_appointment_to_public_service,:first_appointment_to_present_position,:promotion_to_present_grade,:confirmation_date, :presence => true

  validates_format_of :email, :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i
  
  #validate :first_appointment_to_public_service_should_be_lesser_than_first_appointment_to_the_present_post,:first_appointment_to_present_post_should_be_lesser_than_promotion_to_present_grade,:promotion_to_present_grade_should_be_lesser_than_confirmation_date
  

  def first_appointment_to_public_service_should_be_lesser_than_first_appointment_to_the_present_post
    if self.first_appointment_to_public_service.present? && self.first_appointment_to_present_position.present?
      errors.add(:base,(I18n.translate!('errors_date.app_date_present_post'))) if self.first_appointment_to_public_service.to_date > self.first_appointment_to_present_position.to_date
    end
  end

  def first_appointment_to_present_post_should_be_lesser_than_promotion_to_present_grade
    if self.first_appointment_to_present_position.present? && self.promotion_to_present_grade.present?
      errors.add(:base,(I18n.translate!('errors_date.present_post_present_grade'))) if self.first_appointment_to_present_position.to_date > self.promotion_to_present_grade.to_date
    end
  end

  def promotion_to_present_grade_should_be_lesser_than_confirmation_date
    if self.promotion_to_present_grade.present? && self.confirmation_date.present?
      errors.add(:base,(I18n.translate!('errors_date.present_grade_confirm_date'))) if self.promotion_to_present_grade.to_date > self.confirmation_date.to_date
    end
  end

end
