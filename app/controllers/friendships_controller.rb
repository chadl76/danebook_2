class FriendshipsController < ApplicationController
	before_action :authenticate_user!

  def create
  	@friendship = current_user.friendships.build(friend_id: params[:friend_id])

  	if @friendship.save
  		flash[:notice] = "Friend requested"
  		redirect_to newsfeed_path(current_user)
  	else
  		flash[:error] = "Unable to request friend"
  		redirect_to :back
  	end
  end

  def update
  	@friendship = Friendship.find_by(id: params[:id])
  	@friendship.update(accepted: true)
  	if @friendship.save
  		redirect_to root_url
  	end
  end

  def destroy
  	@friendship = Friendship.find_by(id: params[:id])
  	@friendship.destroy
  	if @friendship.destroy
	    redirect_to newsfeed_path(current_user)
  	end
  end
end
