class VotesController < ApplicationController
	before_action :authenticate_user!

	def create
	  question = Question.find(params[:question_id])
	  question.votes.create(user: current_user)

	  redirect_to root_path
	end

	def destroy
	  question = Question.find(params[:question_id])
	  question.votes.where(user: current_user).take.try(:destroy)

	  redirect_to root_path
	end
end
