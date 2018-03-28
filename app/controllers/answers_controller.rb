class AnswersController < ApplicationController

	def create
		question = Question.find(params[:question_id])
		question.answers.create(answers_params)
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

	private
	def answers_params
		params.require(:answer).permit(:description).merge(user: current_user)
	end
end
