class Newsletter < ActiveRecord::Base
  belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
  after_create :send_newsletters
  attr_accessor :agency, :department, :user, :type
  #  validates_format_of :from, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :if=>Proc.new {|u| !u.from.blank?}
  #  validates_format_of :to, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,:if=>Proc.new {|u| (u.to!="All Users" && u.to!="All Dept Admins")  && !u.to.blank? }
  validates :from, :to, :subject, :presence => true

  def send_newsletters
    users=[]
    if self.to == "All Users"
      users = User.active
    elsif self.to=="All Dept Admins"
      users =  User.active.joins(:role_memberships).where("role_memberships.role_id=2")
    elsif self.to=="Select Agency"
      if self.agency!=nil
        departments = Department.active.joins(:agency).where(:agency_id=>self.agency).collect(&:id)
        users = User.active.joins(:role_memberships).where("role_memberships.department_id in (?)", departments)
        agency= Agency.find(self.agency)
        self.to = agency.name.to_s + " Agency"
      end
    elsif self.to=="Select Department"
      if self.agency!=nil && self.department!=nil
        department = Department.find_by_agency_id_and_id(self.agency, self.department)
        users = User.active.joins(:role_memberships).where("role_memberships.department_id = ?", department.id)
        self.to = department.name.to_s + " Department"
      end
    elsif  self.to=="Select Dept Admin"
      if self.user!=nil
        users= User.where(:ic_number => self.user)
        self.to = users.first.email
      end
    end
    self.update_attribute(:to, self.to)
    if users && !users.empty?
      users.each do |user|
        begin
          Stalker.enqueue("#{SPREFIX}.send.newsletter", :id => self.id, :user_email => user.email, :subject => self.subject, :content => self.content)
          #UserMailer.newsletter(user_email,self.subject, self.content).deliver
        rescue Exception=>e
          p "Exception occurred due to : #{e.to_s}"
        end
      end
    end
  end

end
