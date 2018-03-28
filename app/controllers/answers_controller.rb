class AnswersController < ApplicationController

	def create
		question = Question.find(params[:question_id])
		if question.answers.create(answers_params)
			redirect_to question, notice: "Respuesta creada exitosamente"
		end
	end

	def destroy
		question. Question.find(params[:question_id])
		if question.answers.destroy
			redirect_to questions, notice: "Respuesta borrada con éxito"
		end
	end

	private
	def answers_params
		params.require(:answer).permit(:description).merge(user: current_user)
	end
end
