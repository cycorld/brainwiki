class HomeController < ApplicationController
  def index
    @startings = Starting.all
  end

  def show
    @nueron = Nueron.find_by_token(params[:token])
    session[:recent_nueron_id] = @nueron.id
    @quizzes = @nueron.quizzes
    @quiz_history = QuizHistory.new
    view_history = ViewHistory.new(nueron: @nueron, user: current_user)
    @study = Studylog.find_by(nueron_id: @nueron.id)
    if @study.present?
      @study = Studylog.find_by(nueron_id: @nueron.id)
      @study.view_count = @study.view_count + 1
    else
      @study = Studylog.new
      @study.nueron_id = @nueron.id
      @study.user_id = current_user.id
      @study.view_count = 1
    end
    Nueron.transaction do
      view_history.save
      @nueron.save
      @study.save
    end
    render 'nuerons/show'
  end
end
