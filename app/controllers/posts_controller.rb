class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_post, only: [:show, :index]

	def new
		@user = current_user
		@post = @user.posts.build
	end

	def show
		@user = current_user
		@post = Post.find(params[:post_id])
	end

	def create
		@user = current_user
		@post = @user.posts.create(post_params)
		if @post.save!
		redirect_to newsfeed_path(@user)
		end		

	end

	private
	
	def set_post
		@post = Post.find_by!(params[:id])
	end
	def post_params
		params.require(:post).permit(
								:id, 
								:user_id,
								:post_id,
								:title, 
								:body)
	end

end
