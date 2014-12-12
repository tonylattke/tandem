class CountryLanguagesController < ApplicationController
  before_action :set_country_language, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @country_languages = CountryLanguage.all
    respond_with(@country_languages)
  end

  def show
    respond_with(@country_language)
  end

  def new
    @country_language = CountryLanguage.new
    respond_with(@country_language)
  end

  def edit
  end

  def create
    @country_language = CountryLanguage.new(country_language_params)
    @country_language.save
    respond_with(@country_language)
  end

  def update
    @country_language.update(country_language_params)
    respond_with(@country_language)
  end

  def destroy
    @country_language.destroy
    respond_with(@country_language)
  end

  private
    def set_country_language
      @country_language = CountryLanguage.find(params[:id])
    end

    def country_language_params
      params.require(:country_language).permit(:country_id, :language_id)
    end
end
