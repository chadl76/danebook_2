class UsersController < ApplicationController
before_action :authenticate_user!

	def index
		@users = User.all
	end

	def newsfeed
		@post_new = current_user.posts.build
		@posts = current_user.posts
		#@comment = Comment.new(comment_params)
	end
end
