class IctFirewall < ActiveRecord::Base
 mount_uploader :attachment, IctFirewallUploader
 belongs_to :user
 has_many :ict_firewall_services
 #accepts_nested_attributes_for :ict_firewall_services, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

 #attr_accessible :requested_from_date,:requested_to_date,:justification,:remarks,:status,:incharge_person,:attachment
 #validates :requested_from_date,:requested_to_date,:justification, :presence => true
end
