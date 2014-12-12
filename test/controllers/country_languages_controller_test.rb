require 'test_helper'

class CountryLanguagesControllerTest < ActionController::TestCase
  setup do
    @country_language = country_languages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:country_languages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create country_language" do
    assert_difference('CountryLanguage.count') do
      post :create, country_language: { country_id: @country_language.country_id, language_id: @country_language.language_id }
    end

    assert_redirected_to country_language_path(assigns(:country_language))
  end

  test "should show country_language" do
    get :show, id: @country_language
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @country_language
    assert_response :success
  end

  test "should update country_language" do
    patch :update, id: @country_language, country_language: { country_id: @country_language.country_id, language_id: @country_language.language_id }
    assert_redirected_to country_language_path(assigns(:country_language))
  end

  test "should destroy country_language" do
    assert_difference('CountryLanguage.count', -1) do
      delete :destroy, id: @country_language
    end

    assert_redirected_to country_languages_path
  end
end
