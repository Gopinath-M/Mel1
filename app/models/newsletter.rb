class Newsletter < ActiveRecord::Base
  belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
#  after_create :send_newsletters


  def send_newsletters
    if self.to == "All"
      users = User.active
      users.each do |user|
        begin
          UserMailer.newsletter(user.email,self.subject, self.content).deliver
        rescue Exception=>e
#          NewsletterUserActivity.create(:newsletter_id => self.id, :email_id => user.email)
          p "======Exceptgion #{e.to_s}"
        end
      end
    else
      users = self.to.split(",")
      users.each do |user_email|
        begin
          UserMailer.newsletter(user_email,self.subject, self.content).deliver
        rescue Exception=>e
           p "======Exceptgion #{e.to_s}"
#          NewsletterUserActivity.create(:newsletter_id => self.id, :email_id => user_email)
         
        end
      end
    end
  end

end
