class PostsController < ApplicationController
	before_action :authenticate_user!

	def new
		@user = curerent_user
		@post = @user.build_post
	end

	def create
		@user = curerent_user
		@post = @user.create_post(post_params)
		if @post.save!
		redirect_to user_timeline_path
		end		

	end

	private
	
	def post_params
		params.require(:post).permit(:user_id, :title, :body)
	end

end
