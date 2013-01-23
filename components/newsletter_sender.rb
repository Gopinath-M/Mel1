#This locks is used to avoid the redundant hits for the table.
ACQUIRE_LOCK="GET_LOCK"
RELEASE_LOCK="RELEASE_LOCK"
require 'rubygems'
require 'drb'
require 'dbi'
require 'logger'
require 'net/http'
require 'rubygems'
require 'tlsmail'
require 'net/smtp'
require 'active_record'
DB = 'DBI:Mysql:melaka_development'
#DB = "melaka_development"
USERNAME = "root"
PASSWORD = "admin"
#database connection
ActiveRecord::Base.establish_connection(
  :adapter => "mysql",
  :host => "127.0.0.1",
  :database => "melaka_development",
  :username => "root",
  :password => 'admin'
)

class AdminEmailSend < ActiveRecord::Base
end

#Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
LOG=Logger.new("admin_email.log","daily")

#This module is used to send the Email
module Mailer
  #This is the class for EMail sending component
  #It inherits the SMTP library class
  class Email < Net::SMTP
    #This method initialize the SMTP server configurations
    def initialize()
      puts "Admin Email Component has started..."
      @server   = "smtp.gmail.com"#"smtp.illian.net"#"smtp.gmail.com"
      @from     = "www.melaka.com"
      @user     = "support@melaka.com"
      @pass     = "testtest"
      @to= Array.new
      @subject  = nil
      @body=nil
      @fileName = nil
      @fileContent = nil
      @contentType=nil
      @fileAttached=false
      LOG.info("Email object is initialized")
      puts "Admin Email Component listening at port no: 2901"
    end

    #This method is used to assign the Email subject
    def subject=(subject)
      @subject=subject
    end
    #This method is used to assign the Email body
    def body=(body)
      @body=body
    end
    #This method is used to assign the TO addresses
    def to=(to)
      @to=to
    end
    #This method is used to assign the Email content type
    def content_type=(type)
      @contentType=type
    end
    #This method is used to assign the file for attachements
    def attachment(fileName,fileContent)
      @fileName,@fileContent=fileName,fileContent
      @fileAttached=true
    end

    #This method is used to send the EMail
    def send(user)
      construct(user)
      begin
        Net::SMTP.start(@server,25) do |smtp|
          report=smtp.send_message(@mailtext,@user,@to)
          #puts report
          LOG.info("Report from Email Server #{report}")
        end
      rescue Exception=>e
        puts "ERROR :: Error in Mailer #{e.to_s}"
        LOG.error("ERROR :: Error in Mailer :: send :: #{e.to_s}")
        return false
      end
    end
    #This method is used to construct the EMail structure
    #It has Header,Body and File attachment
    private
    def construct(user)
      begin
        marker="AUNIQUEMARKER"
        @mailtext = "From: #{user}\n"
        @mailtext << "To: #{@to} <#{@to}>\n"
        @mailtext << "Subject: #{@subject}\n"
        @mailtext << "MIME-Version: 1.0\n"
        @mailtext << "Content-Type: text/html\n"
        @mailtext << @body
      rescue Exception=>e
        LOG.error("ERROR :: Error in Mailer :: construct :: #{e.to_s}")
      end
    end
  end
end


class Emailer

  def send_newsletter_email(subject,body,email_id,unsubscribe_string)
    begin
      LOG.info("Create Email object to send Email")
      #creating mailer objects here
      mail=Mailer::Email.new
      mail.subject=subject
      #formatting msils over here
      mailBody="\n"
      mailBody+=body
      mailBody+=unsubscribe_string
      mail.body=mailBody
      mail.to=email_id
      #here we are setting the content type as text/html..
      mail.content_type="text/html"
      mail.send("Melaka Team <support@melaka.com>")
      #mail.send("Asha C <asha@zestadz.com>")
    rescue Exception=>e
      LOG.error("ERROR :: send_newsletter_email :: admin_email_sender :: #{e.to_s}")
      puts "ERROR ::send_newsletter_email :: admin_email_sender component :: #{e.to_s}"
    end
  end

  def send_blast_email(subject,body,email_id,user)
    begin
      LOG.info("Create Email object to send Email")
      #creating mailer objects here
      mail=Mailer::Email.new
      mail.subject=subject
      #formatting msils over here
      mailBody="\n"
      mailBody+=body
      mail.body=mailBody
      mail.to=email_id
      #here we are setting the content type as text/html..
      mail.content_type="text/html"
      mail.send(user)
    rescue Exception=>e
      LOG.error("ERROR :: send_newsletter_email :: admin_email_sender :: #{e.to_s}")
      puts "ERROR ::send_newsletter_email :: admin_email_sender component :: #{e.to_s}"
    end
  end


  def send_newsletter
    begin
      @db = DBI.connect(DB, USERNAME, PASSWORD)
      p @db.inspect
      rows=@db.select_one("select * from newsletters where status='New' and posted_on='#{Date.today}'")
      unless (rows.blank? || rows.empty?)
        begin
          #rows.each do |mes|
          begin
            if @db.connected?
              sql="select id,email from users where status='Active' and email!=''"
              users=@db.select_all(sql)
            else
              @db = DBI.connect("melaka_development", "root", "admin")
              sql="select id,email from users where status='Active' and email!=''"
              users=@db.select_all(sql)
            end
          rescue Exception=>e
            puts "ERROR :: admin_email_sender :: send_newsletter :: #{e.to_s}"
          end
          begin
            if (!users.blank?)
              # for i in 0...5000
              begin
                users.each do |user|
                  send_newsletter=send_newsletter_email(rows['subject'],rows['message'],user['email'])
                  #~ send_newsletter=send_newsletter_email(rows['subject'],rows['message'],'nirmala@mobile-worx.com',unsubscribe_string)
                end
              rescue Exception=>e
                puts "ERROR :: admin_email_sender :: send_newsletter :: #{e.to_s}"
              end
            end
          rescue Exception=>e
            puts "ERROR :: admin_email_sender :: send_newsletter :: #{e.to_s}"
          end
          update_sql="update newsletters set status='sent' where id=#{rows['id']}"
          if @db.connected?
            @db.execute(update_sql)
          else
            @db = DBI.connect(DB, USERNAME, PASSWORD)
            @db.execute(update_sql)
          end
          # end
        rescue Exception=>e
          puts "Error in rows : #{e.to_s}"
        end
      end
    rescue Exception=>e
      LOG.error("ERROR :: admin_email_sender :: send_newsletter :: #{e.to_s}")
      puts "ERROR :: admin_email_sender :: send_newsletter :: #{e.to_s}"
    ensure
      @db.disconnect if @db.connected?
    end
  end


  def send_bulk_email(email_ids,mail_from,message_id)
    begin
      @aes=AESSecurity.new()
      puts "coming inside send_bulk_email component"
      @db = DBI.connect("melaka_development", "root", "admin")
      rows=@db.select_one("select * from newsletters where status='New' and id=#{message_id}")

      for email in email_ids
        msg="<span style='font-family:Arial, Helvetica,sans-serif;font-size:12px'>Dear #{email.split(" ")[0]},</span>"
        #msg="Dear #{email.split(" ")[0]}"
        user=@db.select_one("select allow_admin_email from users where email='#{email.split(" ")[1]}'")
        unless user.blank?

          msg+=rows['message']
          send_bulk_email=send_blast_email(rows['subject'],msg,"#{email.split(" ")[1]}",mail_from)
        end
      end
      update_sql="update newsletters set status='sent' where id=#{rows['id']}"
      if @db.connected?
        @db.execute(update_sql)
      else
        @db = DBI.connect("melaka_development", "root", "admin")
        @db.execute(update_sql)
      end
      #~ end
    rescue Exception=>e
      LOG.error("ERROR :: admin_email_sender :: send_newsletter :: #{e.to_s}")
      puts "ERROR :: admin_email_sender :: send_newsletter :: #{e.to_s}"
    ensure
      @db.disconnect if @db.connected?
    end
  end
end
#This is the emailer class object to initiate the Emailer class
mailer=Emailer.new
#mailer.send_newsletter
#~ print "Starting Emailer Server 5556 :: "
#~ print "OK\n"
DRb.start_service("druby://localhost:2901", mailer)
DRb.thread.join
