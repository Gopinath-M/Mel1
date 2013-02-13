class NewsletterMailer < ActionMailer::Base
  default :from => "from@example.com"
  layout false 
  def send_newsletter(user_email, subject, content)
    mail(:to => user_email, :subject => subject)do |format|
      format.html { render :text => content }
    end
  end
end
