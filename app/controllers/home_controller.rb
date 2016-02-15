class HomeController < ApplicationController
  def index
    @startings = Starting.all
  end

  def show
    @nueron = Nueron.find_by_token(params[:token])
    session[:recent_nueron_id] = @nueron.id
    @quizzes = @nueron.quizzes
    @nueron.viewcount +=1
    @nueron.save
    ViewHistory.create(nueron: @nueron, user: current_user)
    render 'nuerons/show'
  end
end
