class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  respond_to :html

  def index
    @friendships = Friendship.all
    respond_with(@friendships)
  end

  def show
    respond_with(@friendship)
  end

  def new
    @friendship = Friendship.new
    respond_with(@friendship)
  end

  def edit
  end

  def create
    @friendship = Friendship.new(
      {:sender_id => params[:friendship][:sender].to_i, 
       :recipient_id => params[:friendship][:recipient].to_i
      })
    @friendship.save
    friendship_invitation = FriendshipInvitation.find_by(
      {:sender_id => params[:friendship][:sender].to_i, 
       :recipient_id => params[:friendship][:recipient].to_i
      })
    friendship_invitation.destroy
    redirect_to (session[:return_to] || root_path), :notice => 'You have a new friend!'
  end

  def update
    @friendship.update(friendship_params)
    respond_with(@friendship)
  end

  def destroy
    @friendship.destroy
    redirect_to root_path
  end

  private
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    def friendship_params
      params.require(:friendship).permit(:sender,:recipient, :tandem)
    end
end
