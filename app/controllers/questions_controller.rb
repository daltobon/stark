class QuestionsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show,]

  def index
    @questions = if params[:search]
      Question.where("title LIKE ? OR description LIKE ?" , "%#{params[:search]}%" , "%#{params[:search]}%")
    else
      @questions = Question.all
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @comment = Comment.new
    @vote = Vote.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(questions_params)
    @question.user = current_user
    if @question.save
     flash[:success] = "Pregunta publicada exitosamente"
     redirect_to question_path(@question)
   else
     flash[:danger] = "Debes llenar todos los datos"
     redirect_to new_question_path 
   end
 end
 
 def edit
   @question = Question.find(params[:id])
 end

 def update
  @question = Question.find(params[:id])
  if @question.update(questions_params)
    flash[:primary] = "Tu pregunta ha sido actualizada"
    redirect_to question_path(@question)
  else
    flash[:danger] = "No se permiten campos vacíos"
    redirect_to edit_question_path
  end
end

def destroy
  question = Question.find(params[:id])
  question.destroy
  flash[:danger] = "Tu pregunta ha sido borrada"
  redirect_to questions_path
end

def voteup
  question = Question.find(params[:id])
  question.votes.create(user: current_user)
  redirect_to question_path 
  flash[:success] = "Voto agregado para Pregunta"
end

def votedown
  question = Question.find(params[:id])
  question.votes.where(user: current_user).take.try(:destroy)
  redirect_to question_path 
  flash[:danger] = "Voto anulado para Pregunta" 
end


private
def questions_params
  params.require(:question).permit(:title, :description, :search, :id)
end

end

