class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model

  attr_accessible :email, :password, :password_confirmation, :remember_me,:ic_number, :first_name, :last_name, :username,:city, :state,:zipcode

  def self.find_for_database_authentication(conditions={})
    self.where("ic_number = ?", conditions[:ic_number]).limit(1).first || self.where("email = ?", conditions[:ic_number]).limit(1).first
  end

  def full_name
    return "NA" if first_name.nil? || last_name.nil?
    full_name=first_name+ " "+last_name
    full_name=full_name.titlecase #capitalize
  end
  
  def make_activation_code
    self.activation_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
  end
    
end

