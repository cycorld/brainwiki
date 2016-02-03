class HomeController < ApplicationController
  def index
    @startings = Starting.all
  end

  def show
    @nueron = Nueron.find_by_token(params[:token])
    session[:recent_nueron_id] = @nueron.id
    render 'nuerons/show'
  end
end
