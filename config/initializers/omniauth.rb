OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	#provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
	provider :facebook, '737106426372271', '7d44ed3d032454719ab6de6c62debdff'
end