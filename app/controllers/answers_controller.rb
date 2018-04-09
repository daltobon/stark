class AnswersController < ApplicationController

	def create
		question = Question.find(params[:question_id])
		@answers  = question.answers.create(answers_params)
		if question.save
			flash[:success] = "Respuesta agregada exitosamente"
			redirect_to question
		else 
			flash[:danger] = "No has respondido adecuadamente"
			redirect_to question
		end
	end

	def destroy
		answer = Answer.find(params[:question_id])
		if answer.destroy
			flash[:success] = "Respuesta borrada con éxito"
			redirect_to question_path
		end
	end

	def voteup
		answer = Answer.find(params[:id])
		answer.votes.create(user: current_user)
		redirect_to question_path(answer.question)
		flash[:success] = "Voto agregado para Respuesta"
	end

	def votedown
		answer = Answer.find(params[:id])
		answer.votes.where(user: current_user).take.try(:destroy)
		redirect_to question_path(answer.question)
		flash[:danger] = "Voto anulado para Respuesta"
		
	end

	private
	def answers_params
		params.require(:answer).permit(:description).merge(user: current_user)
	end
end
