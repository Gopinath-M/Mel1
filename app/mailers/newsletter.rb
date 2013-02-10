class Newsletter < ActionMailer::Base
  default :from => "from@example.com"
  layout false 
  def newsletter(user_email, subject, content)
    mail(:to => user_email, :subject => subject, :content=>content)
  end
  def template(user_email, subject, content)
    mail(:to => user_email, :subject => subject, :content=>content)
  end
end
