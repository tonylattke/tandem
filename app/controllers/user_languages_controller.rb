class UserLanguagesController < ApplicationController
  before_action :set_user_language, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @user_languages = UserLanguage.all
    respond_with(@user_languages)
  end

  def show
    respond_with(@user_language)
  end

  def new
    @user_language = UserLanguage.new
    respond_with(@user_language)
  end

  def edit
  end

  def create
    @user_language = UserLanguage.new(user_language_params)
    @user_language.save
    respond_with(@user_language)
  end

  def update
    @user_language.update(user_language_params)
    respond_with(@user_language)
  end

  def destroy
    @user_language.destroy
    respond_with(@user_language)
  end

  private
    def set_user_language
      @user_language = UserLanguage.find(params[:id])
    end

    def user_language_params
      params.require(:user_language).permit(:user_id, :language_id, :level, :learn)
    end
end
