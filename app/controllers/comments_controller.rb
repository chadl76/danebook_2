class CommentsController < ApplicationController
	before_action :authenticate_user!


	def new
		@user = current_user
		@post = Post.find(params[:post_id])
		@comment = Comment.new(post_id: params[:post_id])
	end



	def create
		#@post = Post.find(params[:post_id])
		@comment = current_user.posts.comments.create(comment_params)
		@comment.author_id = current_user.id

		if @comment.save!
		render  'users/newsfeed'
	end
	end

	private

	def comment_params
		params.require(:comment).permit(
								:id, 
								:author_id,
								:post_id, 
								:body)
	
	end
end




	