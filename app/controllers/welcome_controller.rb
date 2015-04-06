class WelcomeController < ApplicationController

	def index
		if user_signed_in?
			redirect_to "/friends"
		end
	end

	def inbox
		@mail_messages = MailMessage.where("recipient_id = ?",current_user).group(:sender_id, :id)
	end

	def sent
		@mail_messages = MailMessage.where("sender_id = ?",current_user).group(:recipient_id, :id)
	end

end