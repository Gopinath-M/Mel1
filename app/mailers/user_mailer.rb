class UserMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def welcomemail_department_user(user,password)
   begin
    @user=user
    @password=password
    mail(:to=>@user.email,:subject =>"Welcome to Melaka")
   rescue Exception=>e
   end
  end
  # Transfer Dept email to user
  def intimate_user(user,department)
    @user=user
    @department=department
    mail(:to=>@user.email,:subject =>"Transfer User to Department")
  end

  def activation_mail_to_department_admin(user)
        @user=user
    mail(:to=>@user.email,:subject =>"#{@user.full_name}! Your Account has been Activated Successfully ")
  end
  #Chat invitation
  def welcomemail_chat_user(emailchecking,resource_user)
    @user=emailchecking
    @resource_user = resource_user
    mail(:from=>@resource_user.email,:to=>@user.email,:subject =>"#{@resource_user.username}! has been sent request to join for chat ")
  end

end
