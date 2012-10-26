class User < ActiveRecord::Base

  before_create :make_activation_code
  #  validates :email,:ic_number, :presence=>true
  #  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:ic_number, :first_name, :last_name, :username,:city, :state,:zipcode, :department_id, :is_admin, :avatar, :avatar_cache, :remove_avatar, :role_id, :widget_one, :widget_two, :profile_status
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
  #validates_uniqueness_of :ic_number
  #  def self.find_for_database_authentication(conditions={})
  #    self.where("ic_number = ?", conditions[:ic_number]).limit(1).first || self.where("email = ?", conditions[:ic_number]).limit(1).first
  #  end

  def full_name
    return "NA" if first_name.nil? || last_name.nil?
    full_name=first_name+ " "+last_name
    full_name=full_name.titlecase #capitalize
  end 

  def is_super_admin?
    p role = Role.where(:name => "Super Admin").first || Role.new

    role.users.include?(self)
  end

  def is_department_admin?
    p role = Role.where(:name => "Department Admin").first || Role.new
    return role.users.include?(self)
  end

  def is_department_user?
    p role = Role.where(:name => "Department User").first || Role.new
    return role.users.include?(self)
  end

  def activate_user
    self.activated_at = Time.now.utc
    self.activation_code = nil
    self.save
  end

  # Activates the user in the database.
  def activate
    @activated = true
    self.activated_at = Time.now.utc
    self.activation_code = nil
    self.save
  end

  def account_active?
    # the existence of an activation code means they have not activated yet
    activation_code.nil?
  end

  #Overrirde basic authentication to check if  user is activated or not before login
  def active_for_authentication?
    super && account_active?
  end

  def save_ip(ip)
    existing = self.ips ? self.ips.split(", ") : []
    new = (ip.to_a + existing).uniq.compact[0..9]
    self.update_attribute(:ips, new.join(", ")) unless new == existing
  end

  private

  def update_avatar_attributes
    if avatar.present? && avatar_changed?
      self.content_type = avatar.file.content_type
      self.file_size = avatar.file.size
    end
  end
  
  protected

  def make_activation_code
    self.activation_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
  end

  #I dont think so this method is needed. Becaz, if we are going to do authentication based on two fields we can use this method. Since we are doing authentication based on IC number only, it is not needed. I checked the sign in and sign up. It's working good. Nirmala, IF u think My suggestion is ok, Please remove it. while you are seeing this msg.
  #def self.find_for_database_authentication(conditions={})
  # self.where("ic_number = ?", conditions[:ic_number]).limit(1).first
  #end
    
end

