class QuizHistoriesController < ApplicationController
  def create
    @index = params[:answer]
    index = @index.to_i

    @nueron = Nueron.find(params[:nueron_id])
    @quiz = Quiz.find(params[:quiz_id])
    history = QuizHistory.new
    history.user_id = current_user.id
    history.nueron_id = @nueron.id
    history.quiz_id = @quiz.id
    history.question = @quiz.question
    history.answer = @quiz.answers[:array][index]
    history.correct = @quiz.answers[:is_correct][index]
    history.save
 #   index = @quiz.answers[:array].index(@params_answer)

    if @quiz.answers[:is_correct][index] == 'true'
      render json: {success: true}
    #  redirect_to nueron_path(@nueron)
    else
      @message = "Incorrect Answer"
      render json: {success: false}
    #  redirect_to nueron_path(@nueron)
    end
  end
end
