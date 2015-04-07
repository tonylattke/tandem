class FriendshipInvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friendship_invitation, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  respond_to :html

  def index
    @friendship_invitations = FriendshipInvitation.all
    respond_with(@friendship_invitations)
  end

  def show
    respond_with(@friendship_invitation)
  end

  def new
    @friendship_invitation = FriendshipInvitation.new
    respond_with(@friendship_invitation)
  end

  def edit
  end

  def create
    @friendship_invitation = FriendshipInvitation.new(
      {:sender_id => params[:friendship_invitation][:sender].to_i, 
       :recipient_id => params[:friendship_invitation][:recipient].to_i
      })
    @friendship_invitation.save
    redirect_to (session[:return_to] || root_path), :notice => 'Your invitation is already sended!'
  end

  def update
    @friendship_invitation.update(friendship_invitation_params)
    respond_with(@friendship_invitation)
  end

  def destroy
    @friendship_invitation.destroy
    respond_with(@friendship_invitation)
  end

  private
    def set_friendship_invitation
      @friendship_invitation = FriendshipInvitation.find(params[:id])
    end

    def friendship_invitation_params
      params.require(:friendship_invitation).permit(:sender,:recipient)
    end
end
