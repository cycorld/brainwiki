class HomeController < ApplicationController
  def index
    @nuerons = Nueron.all
  end
end
