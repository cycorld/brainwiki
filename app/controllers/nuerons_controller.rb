class NueronsController < ApplicationController
  before_action :set_nueron, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

  # GET /nuerons
  # GET /nuerons.json
  def index
    @nuerons = Nueron.all
    @synapses = Synapse.all
  end

  # GET /nuerons/1
  # GET /nuerons/1.json
  def show
    quiz = Quiz.new
    @nueron = Nueron.find(params[:id])
    @quizzes = @nueron.quizzes
    @quiz_history = QuizHistory.new
  end

  # GET /nuerons/new
  def new
    @nueron = Nueron.new
  end

  # GET /nuerons/1/edit
  def edit
  end

  # POST /nuerons
  # POST /nuerons.json
  def create
    @nueron = Nueron.new(nueron_params)
    @nueron.user_id = current_user.id

    respond_to do |format|
      if @nueron.save
        session[:recent_created_nueron_id] = @nueron.id
        format.html { redirect_to new_synapse_path, notice: 'Nueron was successfully created.' }
        format.json { render :show, status: :created, location: @nueron }
      else
        format.html { render :new }
        format.json { render json: @nueron.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nuerons/1
  # PATCH/PUT /nuerons/1.json
  def update
    if @nueron.user == current_user
      result = @nueron.update(nueron_params)
    else
      result = @nueron.update(params.require(:nueron).permit(:note))
    end
    respond_to do |format|
      if result
        format.html { redirect_to @nueron, notice: 'Nueron was successfully updated.' }
        format.json { render :show, status: :ok, location: @nueron }
      else
        format.html { render :edit }
        format.json { render json: @nueron.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nuerons/1
  # DELETE /nuerons/1.json
  def destroy
    if @nueron.user == current_user
      @nueron.update_attribute(:is_valid, false)
      respond_to do |format|
        format.html { redirect_to nuerons_url, notice: 'Nueron was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to nuerons_url, notice: 'You do not have permission.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nueron
      @nueron = Nueron.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nueron_params
      params.require(:nueron).permit(:title, :vid, :note)
    end

    def pair_params
      params.permit(:origin_id, :next_id)
    end
end
