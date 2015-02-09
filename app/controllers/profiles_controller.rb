class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @profiles = Profile.all
    @friendships = Friendship.all
    @lan = Language.all
    respond_with(@profiles,@friendships)
  end

  def show
    # it's not you
    if current_user != @profile.user
      # Check friendship
      friendships = Friendship.where("(recipient_id = ? and sender_id = ?) or (sender_id = ? and recipient_id = ?)",@profile.user,current_user,current_user,@profile.user)
      if not friendships.any?
        @is_friend=true
      end
    end

    respond_with(@profile)
  end

  def new
    @profile = Profile.new
    respond_with(@profile)
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.save
    respond_with(@profile)
  end

  def update
    @profile.update(profile_params)
    respond_with(@profile)
  end

  def destroy
    @profile.destroy
    respond_with(@profile)
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:user_id, :nickname, :name, :lastname, :language_id, :telf, :birthdate, :about, :question, :answer)
    end
end
