class User < ActiveRecord::Base
#  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
                  attr_accessible :email, :password, :password_confirmation, :remember_me,:ic_number, :first_name, :last_name, :username,:city, :state,:zipcode, :department_id, :is_admin, :avatar, :avatar_cache, :remove_avatar, :role_id
  has_many :role_memberships
  has_many :roles, :through => :role_memberships
  has_many :departments, :through => :role_memberships

  scope :active, where(:deleted => false)
  #Validation For SignUp,Create user, Page Starts Here
  #  validates :avatar,    :file_size => {:maximum => 0.5.megabytes.to_i}, :if=>Proc.new {|u| !u.avatar.blank?}
  mount_uploader :avatar, ProfileImageUploader  
 # validates_presence_of :avatar
  validates_integrity_of :avatar
  validates_processing_of :avatar
  #before_save :update_avatar_attributes

  def self.find_for_database_authentication(conditions={})
    self.where("ic_number = ?", conditions[:ic_number]).limit(1).first || self.where("email = ?", conditions[:ic_number]).limit(1).first
  end

  def full_name
    return "NA" if first_name.nil? || last_name.nil?
    full_name=first_name+ " "+last_name
    full_name=full_name.titlecase #capitalize
  end 

  def is_super_admin?
    role = Role.where(:name => "Super Admin").first || Role.new
    role.users.include?(self)
  end

  def is_department_admin?
      role = Role.where(:name => "Department Admin").first || Role.new
      role.users.include?(self)
  end

   def is_department_user?
      role = Role.where(:name => "Department User").first || Role.new
      role.users.include?(self)
  end

  private

  def update_avatar_attributes
    if avatar.present? && avatar_changed?
      self.content_type = avatar.file.content_type
      self.file_size = avatar.file.size
    end
  end

  #I dont think so this method is needed. Becaz, if we are going to do authentication based on two fields we can use this method. Since we are doing authentication based on IC number only, it is not needed. I checked the sign in and sign up. It's working good. Nirmala, IF u think My suggestion is ok, Please remove it. while you are seeing this msg.
  #def self.find_for_database_authentication(conditions={})
  # self.where("ic_number = ?", conditions[:ic_number]).limit(1).first
  #end
    
end

