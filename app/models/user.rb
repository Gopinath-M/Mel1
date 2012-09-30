class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:ic_number, :first_name, :last_name, :username,:city, :state,:zipcode, :department_id, :is_admin, :avatar, :role_id

  belongs_to :department
  #Validation For SignUp,Create user, Page Starts Here
  #  validates :avatar,    :file_size => {:maximum => 0.5.megabytes.to_i}, :if=>Proc.new {|u| !u.avatar.blank?}
  validates_integrity_of :avatar
  validates_processing_of :avatar
  
  validates :first_name,:last_name,:ic_number,:username,:city,:state,:zipcode,:department_id, :presence => true
  validates :first_name,:last_name, :length => { :in => 2..50 },:format => { :with => /\A[a-zA-Z]+\z/, :message => "Only letters allowed" }, :if => Proc.new {|u| !u.first_name.blank? || !u.last_name.blank?}
  validates :ic_number, :format => { :with => /([0-9][0-9])((0[1-9])|(1[0-2]))((0[1-9])|([1-2][0-9])|(3[0-1]))\-([0-9][0-9])\-([0-9][0-9][0-9][0-9])/ }, :if => Proc.new {|u| !u.ic_number.blank?}
  validates :username, :format => { :with => /^[a-zA-Z0-9][a-zA-Z0-9-_.]{2,8}[a-zA-Z0-9]$/} , :if => Proc.new {|u| !u.username.blank? }
  validates :zipcode, :format =>{ :with => %r{\d{5}},
    :if => Proc.new {|u| !(u.zipcode.blank?) },
    :message => "should be a 5 digit number"}
  #Validation For SignUp,Create user Page Ends Here


  def self.find_for_database_authentication(conditions={})
    self.where("ic_number = ?", conditions[:ic_number]).limit(1).first || self.where("email = ?", conditions[:ic_number]).limit(1).first
  end

  def full_name
    return "NA" if first_name.nil? || last_name.nil?
    full_name=first_name+ " "+last_name
    full_name=full_name.titlecase #capitalize
  end

  #I dont think so this method is needed. Becaz, if we are going to do authentication based on two fields we can use this method. Since we are doing authentication based on IC number only, it is not needed. I checked the sign in and sign up. It's working good. Nirmala, IF u think My suggestion is ok, Please remove it. while you are seeing this msg.
  #def self.find_for_database_authentication(conditions={})
  # self.where("ic_number = ?", conditions[:ic_number]).limit(1).first
  #end
    
end

