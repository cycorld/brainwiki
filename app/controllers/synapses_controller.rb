class SynapsesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def new
    @nuerons = Nueron.all
    @prev = @nuerons.where(id: session[:recent_nueron_id]).take
    @next = @nuerons.where(id: session[:recent_created_nueron_id]).take
  end

  def create
    Synapse.create(user_id: current_user.id, origin_id: params[:prev], next_id: params[:next])
    redirect_to '/show/' + Nueron.find(params[:next]).token
  rescue ActiveRecord::RecordNotUnique
    flash[:notice] = "이미 만들어진 시냅스가 있습니다"
    redirect_to '/synapses/new'
  end

  def weight_create
    @synapse = Synapse.find(params[:id])
    @synapse.update_attribute("weight", @synapse.weight + 1)

    if params[:kind] == "active"
      redirect_to nueron_path(@synapse.next_id)
    else
      redirect_to nueron_path(@synapse.origin_id)
    end
  end
end
