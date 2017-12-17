class LikesController < ApplicationController
	before_action :authenticate_user!
  
  def new
  	@user = current_user
  end

  def create
  	@user = current_user
  	@like = Like.new(like_params)
  	@like.user_id = current_user.id
  	if @like.save!
  		redirect_to newsfeed_path(@user)
  	end
  end


  private

  def like_params
  	params.require(:like).permit(:post_id)
  end
end
