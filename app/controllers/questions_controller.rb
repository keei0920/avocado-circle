class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.includes(:user).order('created_at DESC')
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
    @answers = @question.answers.includes(:user)
    @answer = Answer.new
  end

  def edit
    unless current_user.id == @question.user_id
      redirect_to root_path
    end
  end

  def update
    if @question.update(question_params)
     redirect_to questions_path
   else
     render :edit, status: :unprocessable_entity
   end
  end

  def destroy
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

  def set_question
    @question = Question.find(params[:id])
  end
end
