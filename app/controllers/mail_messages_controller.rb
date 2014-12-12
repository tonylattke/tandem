class MailMessagesController < ApplicationController
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
    @mail_message = MailMessage.new(mail_message_params)
    @mail_message.save
    respond_with(@mail_message)
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
      params.require(:mail_message).permit(:user_id, :user_id, :text, :time)
    end
end
