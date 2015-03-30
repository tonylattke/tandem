class MailMessagesController < ApplicationController
  before_action :authenticate_user!
  skip_before_filter :verify_authenticity_token, :only => :create
  before_action :set_mail_message, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @mail_messages = MailMessage.all
    respond_with(@mail_messages)
  end

  def show
    respond_with(@mail_message)
  end

  def new
    @mail_message = MailMessage.new
    respond_with(@mail_message)
  end

  def edit
  end

  def create
    if params[:mail_message][:text].length > 0
      @mail_message = 
        MailMessage.new(
          {:sender_id => params[:mail_message][:sender].to_i, 
           :recipient_id => params[:mail_message][:recipient].to_i, 
           :text => params[:mail_message][:text]
          })  
      @mail_message.save
      redirect_to sent_path
    else
      redirect_to (session[:return_to] || root_path), :alert => 'Error: Your message was to short'
    end
  end

  def update
    @mail_message.update(mail_message_params)
    respond_with(@mail_message)
  end

  def destroy
    @mail_message.destroy
    respond_with(@mail_message)
  end

  private
    def set_mail_message
      @mail_message = MailMessage.find(params[:id])
    end

    def mail_message_params
      params.require(:mail_message).permit(:sender, :recipient, :text)
    end
end
