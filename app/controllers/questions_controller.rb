class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
     redirect_to questions_path
   else
     render :edit, status: :unprocessable_entity
   end
  end

  def destroy
    @question = Question.find(params[:id])
   if @question.destroy
     redirect_to root_path
   else
     redirect_to questions_path
   end
  end

  private

  def question_params
    params.require(:question).permit(:image, :title, :text).merge(user_id: current_user.id)
  end
end
