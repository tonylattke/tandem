class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  # before_filter :require_permission, only: :edit

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
    languages_all = Language.all
    @languages = []
    for language in languages_all
      @languages.push([language.name,language.id])
    end
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.save
    respond_with(@profile)
  end

  def update
    
    profile_aux = Profile.find_by(nickname: profile_params['nickname'])

    if profile_aux != nil
      if (profile_aux.id != @profile.id)
        redirect_to edit_profile_path(@profile), :alert => 'Error: Nickname already exists'
      else
        @profile.update(profile_params)
        respond_with(@profile)
      end
    else
      @profile.update(profile_params)
      respond_with(@profile)
    end
  end

  def destroy
    @profile.destroy
    respond_with(@profile)
  end

  def require_permission
    if current_user != @profile.user
      redirect_to root_path
      #Or do something else here
    end
  end

  private
    def set_profile
      @profile = Profile.friendly.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:user_id, :nickname, :name, :lastname, :language_id, :telf, :birthdate, :about, :question, :answer, :gender)
    end

    before_filter :require_permission, only: :edit

end
