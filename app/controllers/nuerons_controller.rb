class NueronsController < ApplicationController
  before_action :set_nueron, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :create, :destroy]

  # GET /nuerons
  # GET /nuerons.json
  def index
    @nuerons = Nueron.all
  end

  # GET /nuerons/1
  # GET /nuerons/1.json
  def show
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
        format.html { redirect_to @nueron, notice: 'Nueron was successfully created.' }
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
    respond_to do |format|
      if @nueron.update(nueron_params)
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
    @nueron.destroy
    respond_to do |format|
      format.html { redirect_to nuerons_url, notice: 'Nueron was successfully destroyed.' }
      format.json { head :no_content }
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
end
