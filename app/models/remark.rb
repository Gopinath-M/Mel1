class Remark < ActiveRecord::Base
  belongs_to :user
  belongs_to :department
  after_create :check_if_null

  def check_if_null
     if self.text.blank?
      self.destroy
    end
  end

end
