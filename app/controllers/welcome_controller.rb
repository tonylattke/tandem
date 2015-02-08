class WelcomeController < ApplicationController
	def index
		@info = "asd"
		if user_signed_in?
			redirect_to "/profiles"
		end
	end
end