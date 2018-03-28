class QuestionsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @questions = Question.all  
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(questions_params)
    @question.user = current_user
    if @question.save
      redirect_to question_path(@question), notice: "Pregunta publicada exitosamente"
    else 
      redirect_to new_question_path, notice: "Debes llenar todos los datos"
    end
  end
  
  def edit
   @question = Question.find(params[:id])
 end

 def update
  @question = Question.find(params[:id])
  if @question.update(questions_params)
    redirect_to question_path(@question), notice: "Tu pregunta ha sido actualizada"
  else
    redirect_to edit_question_path, notice: "No se pudo actualizar el registro, Intente de nuevo"
  end
end

def destroy
  question = Question.find(params[:id])
  question.destroy
  redirect_to questions_path, notice: "Tu pregunta ha sido borrada"
end

private
def questions_params
  params.require(:question).permit(:title, :description, :vote, :id)
end

end

