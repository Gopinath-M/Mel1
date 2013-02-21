class Newsletter < ActiveRecord::Base
  belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
  after_create :send_newsletters
  attr_accessor :agency, :department, :user, :type
  #  validates_format_of :from, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :if=>Proc.new {|u| !u.from.blank?}
  #  validates_format_of :to, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,:if=>Proc.new {|u| (u.to!="All Users" && u.to!="All Dept Admins")  && !u.to.blank? }
  validates :from, :to, :subject, :presence => true

  def send_newsletters
    if self.to == "All Users" || "All Dept Admins"
      users = self.to == "All Users" ? User.active : User.active.joins(:role_memberships).where("role_memberships.role_id=2")
      users.each do |user|
        begin
          Stalker.enqueue("#{SPREFIX}.send.newsletter", :id => self.id, :user_email => user.email, :subject => self.subject, :content => self.content)
          #UserMailer.newsletter(user.email,self.subject, self.content).deliver
        rescue Exception=>e
          p "Exception occurred due to : #{e.to_s}"
        end
      end
    else
      if self.to!=nil && self.to.include?(",")
        users = self.to.split(",")
      else
        users =[self.to]
      end
      users.each do |user_email|
        begin
          Stalker.enqueue("#{SPREFIX}.send.newsletter", :id => self.id, :user_email => user_email, :subject => self.subject, :content => self.content)
          #UserMailer.newsletter(user_email,self.subject, self.content).deliver
        rescue Exception=>e
          p "Exception occurred due to : #{e.to_s}"
        end
      end
    end
  end

end
