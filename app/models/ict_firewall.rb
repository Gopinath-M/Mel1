class IctFirewall < ActiveRecord::Base
 mount_uploader :attachment, IctFirewallUploader
 belongs_to :user
 has_many :ict_firewall_services
 after_update :mail_to_user_regarding_ict_firewall_status_updates
 #accepts_nested_attributes_for :ict_firewall_services, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

 #attr_accessible :requested_from_date,:requested_to_date,:justification,:remarks,:status,:incharge_person,:attachment
 #validates :requested_from_date,:requested_to_date,:justification, :presence => true
   def mail_to_user_regarding_ict_firewall_status_updates    
    @user= User.find(self.user_id)    
    UserMailer.send_mail_to_user_for_ict_firewall_booking(user,self).deliver    
  end
end
