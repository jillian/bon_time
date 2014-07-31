class FriendshipsController < ApplicationController

  # before_action :authenticate_user!

  # def index
  #   @users = User.all
  #   @friendships = current_user.friendships
  # end


  #POST /friendships
  def create
    @friendship = current_user.friendships.create(friendship_params)
    if @friendship.save
      flash[:notice] = "Friendship request sent..."
      redirect_to :back
    else
      flash[:error] = "Unable to add friend"
      redirect_to :back
    end
  end

  def accept_invitation
    friend = User.find(params[:id])
    friendship = current_user.inverse_friendships(friend).first
    friendship.approved = true
    friendship.save!
    redirect_to :back
  end

  def decline_invitation
    friend = User.find(params[:id])
    friendship = current_user.inverse_friendships.(friend).first
    friendship.approved = false
    friendship.save!
    redirect_to :back
  end

  # POST /friendships/99/revoke?user_id=1
  # POST /friendships/99/revoke?friend_id=2
  def revoke
    friendship = if params[:user_id]
      Friendship.where(id: params[:id], user_id: params[:user_id], friend_id: current_user.id)
    elsif params[:friend_id]
      current_user.friendships.where(id: params[:id], friend_id: params[:friend_id])
    end
    if friendship
      friendship.accepted = false
      friendship.save!
    end
  end

  private

  def friendship_params
    params.require(:acts_as_friendable_friendship).permit(:friend_id)
  end
end
