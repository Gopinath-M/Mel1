class NewsletterMailer < ActionMailer::Base
  default :from => "from@example.com"
  layout false
  
  def send_newsletter(user_email, subject, content)
    mail(:to => user_email, :subject => subject)do |format|
      format.html { render :text => content }
    end
  end

  def send_template(user_email, subject, content,user)
    if content.include?("{{user.username}}")
     content.sub!("{{user.username}}",user.username)
    end
    if content.include?("{{user.email}}")
     content.sub!("{{user.email}}",user.email)
    end

    mail(:to => user_email, :subject => subject)do |format|
      format.html { render :text => content }
    end
  end
  
end
