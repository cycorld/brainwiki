class HomeController < ApplicationController
  def index
    @nuerons = Nueron.all
    @synapses = Synapse.all
  end
end
