class UserMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def welcomemail_department_user(user,password)
   begin
    p "=========conmes to user mailer"
    p "======#{user.inspect} :: #{password.inspect}"
    @user=user
    @password=password
    mail(:to=>@user.email,:subject =>"Welcome to Melaka")
   rescue Exception=>e
     p "===========#{e.to_s}"
   end
  end
  
end