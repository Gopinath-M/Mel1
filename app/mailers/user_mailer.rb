class UserMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def welcomemail_department_user(user,password)
   begin
    @user=user
    @password=password
    mail(:to=>@user.email,:subject =>"Welcome to Melaka")
   rescue Exception=>e
     p "===========#{e.to_s}"
   end
  end
  # Transfer Dept email to user
  def intimate_user(user,department)
    @user=user
    @department=department
    mail(:to=>@user.email,:subject =>"Transfer User to Department")
  end
end
