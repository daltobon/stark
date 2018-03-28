class AnswersController < ApplicationController

	def create
		question = Question.find(params[:question_id])
		question.answers.create(answers_params)
		if question.save
			redirect_to question, notice: "Respuesta creada exitosamente"
		else 
			redirect_to question, notice: "No se permiten campos vacíos"
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
