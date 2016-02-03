class QuizzesController < ApplicationController
  def create
    @nueron = Nueron.find(params[:id])
    @quiz = Quiz.new(quiz_params)
    @quiz.user_id = current_user.id
    @quiz.nueron_id = @nueron.id
    redirect_to root_path
  end

  private
    def quiz_params
      params.require(:quiz).permit(:question, :answers, :order)
    end
end
