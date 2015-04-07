require 'test_helper'

class FriendshipInvitationsControllerTest < ActionController::TestCase
  setup do
    @friendship_invitation = friendship_invitations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:friendship_invitations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create friendship_invitation" do
    assert_difference('FriendshipInvitation.count') do
      post :create, friendship_invitation: { sender: @friendship_invitation.sender, recipient: @friendship_invitation.recipient }
    end

    assert_redirected_to friendship_invitation_path(assigns(:friendship_invitation))
  end

  test "should show friendship_invitation" do
    get :show, id: @friendship_invitation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @friendship_invitation
    assert_response :success
  end

  test "should update friendship_invitation" do
    patch :update, id: @friendship_invitation, friendship_invitation: { sender: @friendship_invitation.sender, recipient: @friendship_invitation.recipient }
    assert_redirected_to friendship_invitation_path(assigns(:friendship_invitation))
  end

  test "should destroy friendship_invitation" do
    assert_difference('FriendshipInvitation.count', -1) do
      delete :destroy, id: @friendship_invitation
    end

    assert_redirected_to friendship_invitations_path
  end
end
