class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show]

  def new
    @nueron = Nueron.find(params[:nueron_id])
    @quiz  = Quiz.new
  end

  def create
    @nueron = Nueron.find(params[:nueron_id])
    quiz = Quiz.new
    quiz.user_id = current_user.id
    quiz.nueron_id = @nueron.id
    quiz.question = params[:quiz][:question]
    quiz.answers[:array] = JSON.parse(params[:quiz][:answers])
    quiz.answers[:correct] = params[:quiz][:correct]
    puts '**********************************'
    puts quiz.answers[:array][0]
    quiz.save
    redirect_to nueron_quiz_path(@nueron, quiz)
  end

  def show
    @nueron = Nueron.find(params[:nueron_id])
  end

  private
    def set_quiz
      @quiz = Quiz.find_by(id: params[:id], nueron_id: params[:nueron_id])
    end

    def quiz_params
      params.require(:quiz).permit(:question, :answers, :order)
    end
end
