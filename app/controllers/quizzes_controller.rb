class QuizzesController < ApplicationController
  def new
    @nueron = Nueron.find(params[:nueron_id])
    @quiz  = Quiz.new
  end

  def create
    @nueron = Nueron.find(params[:nueron_id])
    @quiz = Quiz.new(quiz_params)
    @quiz.user_id = current_user.id
    @quiz.nueron_id = @nueron.id
    @quiz.save
    redirect_to @nueron
  end

  private
    def quiz_params
      params.require(:quiz).permit(:question, :answers, :order)
    end
end
