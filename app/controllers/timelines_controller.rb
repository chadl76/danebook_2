class TimelinesController < ApplicationController
	before_action :authenticate_user!
	#before_action :set_user, only: [:show, :edit, :update, :destroy]

	
	def show
		@user = current_user
		@post = @user.posts.build
	
	end

	def create
		@user = current_user
		@post = Post.new(post_params)
		@post.user_id = @user.id
		@post.save!
		if @post.save
			redirect_to user_timeline_path(@user)
		end
	end



	private

	def set_user
		@user  ||= User.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:user_id, :title, :body)
	end

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email)
	end
end
