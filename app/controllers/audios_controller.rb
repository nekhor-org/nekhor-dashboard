class AudiosController < ApplicationController
  before_action :set_audio, only: %i[ show edit update destroy ]

  # GET /audios or /audios.json
  def index
    @audios = Audio.all
  end

  # GET /audios/1 or /audios/1.json
  def show
  end

  # GET /audios/new
  def new
    @audio = Audio.new
  end

  # GET /audios/1/edit
  def edit
  end

  # POST /audios or /audios.json
  def create
    @audio = Audio.new(audio_params)

    respond_to do |format|
      if @audio.save
        format.html { redirect_to audio_url(@audio), notice: "Audio was successfully created." }
        format.json { render :show, status: :created, location: @audio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @audio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /audios/1 or /audios/1.json
  def update
    respond_to do |format|
      if @audio.update(audio_params)
        format.html { redirect_to audio_url(@audio), notice: "Audio was successfully updated." }
        format.json { render :show, status: :ok, location: @audio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @audio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audios/1 or /audios/1.json
  def destroy
    @audio.destroy

    respond_to do |format|
      format.html { redirect_to audios_url, notice: "Audio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audio
      @audio = Audio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def audio_params
      params.require(:audio).permit(:post_id, :link)
    end
end
