class QuizHistoriesController < ApplicationController
  def create
    @index = params[:answer]
    index = @index.to_i
    @nueron = Nueron.find(params[:nueron_id])
    @quiz = Quiz.find(params[:quiz_id])
    @study = Studylog.find_by(nueron_id: @nueron.id)
    unless QuizHistory.find_by(quiz_id: @quiz.id).present?
      @study.number_of_quiz += 1
    end
    history = QuizHistory.new
    history.user_id = current_user.id
    history.nueron_id = @nueron.id
    history.quiz_id = @quiz.id
    history.question = @quiz.question
    history.answer = @quiz.answers[:array][index]
    history.correct = @quiz.answers[:is_correct][index]


    QuizHistory.transaction do
      @study.save
      history.save
    end

    if @quiz.answers[:is_correct][index] == 'true'
      render json: {success: true}
    else
      @message = "Incorrect Answer"
      render json: {success: false}
    end
  end
end
