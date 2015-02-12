class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :get_user

  def get_user
    if user_signed_in?
      @user_profile = Profile.find_by(user: current_user.id)
      if @user_profile.nil?
        profile = Profile.new({:user => current_user, :photo => "http://tony.lattke.org/img/perfil.png"})
        profile.save
        @user_profile = profile
      end
    end
  end

end
