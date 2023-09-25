class JoboffersController < ApplicationController
  before_action :set_joboffer, only: %i[ show edit update destroy ]

  # GET /joboffers or /joboffers.json
  def index
    @joboffers = Joboffer.all
  end

  # GET /joboffers/1 or /joboffers/1.json
  def show
    @joboffer = Joboffer.find(params[:id])
  end

  # GET /joboffers/new
  def new
    @joboffer = Joboffer.new
  end

  # GET /joboffers/1/edit
  def edit
  end

  # POST /joboffers or /joboffers.json
  def create
    @joboffer = Joboffer.new(joboffer_params)

    respond_to do |format|
      if @joboffer.save
        format.html { redirect_to joboffer_url(@joboffer), notice: "Joboffer was successfully created." }
        format.json { render :show, status: :created, location: @joboffer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @joboffer.errors, status: :unprocessable_entity }
      end
    end
  end

  def apply
    @joboffer = Joboffer.find(params[:id])
    current_user.apply_to(@joboffer) # Supongamos que tienes un método en el modelo User para gestionar las postulaciones

    redirect_to @joboffer, notice: 'Has aplicado a la oferta de trabajo correctamente.'
  end

  # PATCH/PUT /joboffers/1 or /joboffers/1.json
  def update
    respond_to do |format|
      if @joboffer.update(joboffer_params)
        format.html { redirect_to joboffer_url(@joboffer), notice: "Joboffer was successfully updated." }
        format.json { render :show, status: :ok, location: @joboffer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @joboffer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /joboffers/1 or /joboffers/1.json
  def destroy
    @joboffer.destroy

    respond_to do |format|
      format.html { redirect_to joboffers_url, notice: "Joboffer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_joboffer
      @joboffer = Joboffer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def joboffer_params
      params.require(:joboffer).permit(:title, :description)
    end
end
