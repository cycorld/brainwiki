class QuizHistoriesController < ApplicationController
  def create
    @index = params[:answer]
    index = @index.to_i
    @nueron = Nueron.find(params[:nueron_id])
    @quiz = Quiz.find(params[:quiz_id])
    @quiz_boolean = @quiz.answers[:is_correct][index]
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
    history.correct = @quiz_boolean
    history.save

    @count_correct_answers = 0
    @quizzes_nueron = @nueron.quizzes
    @quizzes_nueron.each do |x|
      if QuizHistory.where(quiz_id: x.id).last.correct
        @count_correct_answers +=1
      end
    end

    @study.correct_answers = @count_correct_answers
    @study.save

    #if @quiz.answers[:is_correct][index] == 'true'
    if @quiz_boolean == 'true'
      render json: {success: true}
    else
      render json: {success: false}
    end
  end
end
