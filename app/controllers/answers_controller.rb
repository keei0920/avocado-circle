class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id]) 
    if @answer.save
      AnswerChannel.broadcast_to @question, { answer: @answer, user: @answer.user } 
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:text).merge(user_id: current_user.id, question_id: params[:question_id])
  end
end