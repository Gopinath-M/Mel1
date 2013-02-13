require File.expand_path("../../config/environment", __FILE__) 
include Stalker

error do |e,job,args|
  puts "something bad happened"
  p e
  puts e.backtrace.join("\n")
  p job
  p args
  puts "happy debugging"
end

job "#{SPREFIX}.send.welcome" do |args| 
  user = User.find(args["id"])  
  password = args["password"]
  puts "sending welcome mail to #{user.email}"
  WelcomeMailer.for_user(user, password).deliver!
end

job "#{SPREFIX}.send.newsletter" do |args|
  puts "sending welcome mail to #{args['user_email']}"
  NewsletterMailer.send_newsletter(args['user_email'], args['subject'],args['content']).deliver!
end

job "#{SPREFIX}.send.template" do |args|
  user = User.find(args["id"])
  puts "sending welcome mail to #{args[:email]}"
  Newsletter.template(args[:user_email],args[:subject],args[:content]).deliver!
end

#
#job "#{SPREFIX}.send.approved_notification" do |args|
#  resource = ResourceIctEquipmentBooking.find(args["id"])
#  puts "sending Approved notification to #{resource.user.email}"
#  UserNotification.resource_approved(resource.user, resource, args["updated_by"]).deliver!
#end

Stalker.work nil
