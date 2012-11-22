class ConversationsController < ApplicationController
  def index
    @users = User.find(:all, :conditions => ["username != ?", current_user.username])
    if request.xhr?
      render :layout=>false
    end

  end

  def show
    if params[:id]
      @user=User.find(params[:id])
      if @user
        @conversations=Conversation.convos(params[:id],current_user.id)
      end
    end

    @users = User.find(:all, :conditions => ["username != ?", current_user.username])
    if request.xhr?
      render :layout=>false
    end
   
  end


  def create   
    @conversation = Conversation.create!(params[:conversation])
    @conversation.from_userid = current_user.id
    @conversation.save

    if request.xhr?
      render :layout=>false
    end
  end

  def list_users
    @users = User.all
  end
  def send_request
    emailchecking = User.find_by_email(params[:email])
    if emailchecking
        UserMailer.welcomemail_chat_user(emailchecking, current_user).deliver
        flash[:notice] = "Chat Request has been sent successfully"
        redirect_to :action => 'index'
    else
      flash[:error] = "Chat Request Failed"
      redirect_to :action => 'index'
    end
  end
 
 
end