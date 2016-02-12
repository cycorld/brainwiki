class StartingsController < ApplicationController
  before_action :set_starting, only: [:show, :edit, :update, :destroy]

  # GET /startings
  # GET /startings.json
  def index
    @startings = Starting.all
  end

  # GET /startings/1
  # GET /startings/1.json
  def show
  end

  # GET /startings/new
  def new
    @starting = Starting.new
    @nuerons = Nueron.all
    @prev = @nuerons.where(id: session[:recent_nueron_id]).take
  end

  # GET /startings/1/edit
  def edit
  end

  # POST /startings
  # POST /startings.json
  def create
    @starting = Starting.new(starting_params)
    @starting.nueron_id = params[:start]
    @starting.user_id = current_user.id

    respond_to do |format|
      if @starting.save
        format.html { redirect_to root_path, notice: 'Starting was successfully created.' }
        format.json { render :show, status: :created, location: @starting }
      else
        format.html { render :new }
        format.json { render json: @starting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /startings/1
  # PATCH/PUT /startings/1.json
  def update
    respond_to do |format|
      if @starting.update(starting_params)
        format.html { redirect_to @starting, notice: 'Starting was successfully updated.' }
        format.json { render :show, status: :ok, location: @starting }
      else
        format.html { render :edit }
        format.json { render json: @starting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /startings/1
  # DELETE /startings/1.json
  def destroy
    @starting.destroy
    respond_to do |format|
      format.html { redirect_to startings_url, notice: 'Starting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_starting
      @starting = Starting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def starting_params
      params.require(:starting).permit(:nueron_id, :user_id, :title, :subtitle, :description)
    end
end
