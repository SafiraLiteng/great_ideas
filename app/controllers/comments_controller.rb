class CommentsController < ApplicationController
	before_action :authenticate_user!, except: [:create]


	def create

		@idea = Idea.find(params[:idea_id])
		@comment = @idea.comments.new(params[:comment].permit(:name, :body))
		@comment.user = current_user

		if current_user
			if @comment.save
				redirect_to idea_path(@idea)
			else
				render 'ideas/show'
			end
		else
			redirect_to new_user_session_path
		end
	end

	def destroy
		@idea = Idea.find(params[:idea_id])
		@comment = @idea.comments.find(params[:id])
		@comment.destroy
		redirect_to idea_path(@idea)
	end

	def update
		@idea = Idea.find params[:idea_id]
		@comment = Comment.find params[:id]
		if can? :flag, @comment
			if @comment.is_flagged
				@comment.is_flagged = false
			else
				@comment.is_flagged = true
			end
			@comment.save
			redirect_to @idea
		else
			redirect_to @idea, alert: "You can not flag this... "
		end
	end

end
