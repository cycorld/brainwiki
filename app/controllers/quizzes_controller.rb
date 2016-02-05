class QuizzesController < ApplicationController
  def new
    @nueron = Nueron.find(params[:nueron_id])
    @quiz  = Quiz.new
  end

  def create
    @nueron = Nueron.find(params[:nueron_id])
   # @quiz = Quiz.new(quiz_params)
    @quiz = Quiz.new
    @quiz.user_id = current_user.id
    @quiz.nueron_id = @nueron.id
    @quiz.question = params[:quiz][:question]
    @quiz.answers = JSON.parse(params[:quiz][:answers])
    arr = params[:quiz][:answers]
    puts "*******************************"
    puts arr
  #  @quiz.answers = params[:quiz][:answers]
    @quiz.order = params[:quiz][:order]
    @quiz.save
    redirect_to @nueron
  end

  def show
    @quiz = Quiz.find(params[:nueron_id][:id])
  end

  private
    def quiz_params
      params.require(:quiz).permit(:question, :answers, :order)
    end
end
