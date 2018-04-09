class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			flash[:success] = "Comentario añadido exitosamente!"
		else
			flash[:danger] = "No se ha podido agregar el Comentario"
		end

		if comment_params[:commentable_type] == 'Question'
			redirect_to question_path(comment_params[:commentable_id])
		else
			@answer = Answer.find(comment_params[:commentable_id])
			redirect_to question_path(@answer.question_id)
		end
	end

	private 
		def comment_params
			params.require(:comment).permit(:commentable_type, :commentable_id, :body, :user_id)
		end
end