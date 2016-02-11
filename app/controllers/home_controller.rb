class HomeController < ApplicationController
  def index
    @nuerons = Nueron.all
    @synapses = Synapse.all
  end

  def show
    @nueron = Nueron.find_by_token(params[:token])
    session[:recent_nueron_id] = @nueron.id
    @quizzes = @nueron.quizzes
    render 'nuerons/show'
  end
end
