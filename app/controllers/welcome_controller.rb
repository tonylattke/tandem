class WelcomeController < ApplicationController

	def index
		@info = "asd"
		if user_signed_in?
			redirect_to "/friends"
		end
	end

	def inbox
		@mail_messages = MailMessage.where("recipient_id = ?",current_user)
	end

	def sent
		@mail_messages = MailMessage.where("sender_id = ?",current_user)
	end

end