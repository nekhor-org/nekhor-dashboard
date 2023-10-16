class LocalNamesController < ApplicationController
  before_action :set_local_name, only: %i[ show edit update destroy ]

  # GET /local_names or /local_names.json
  def index
    @local_names = LocalName.all
  end

  # GET /local_names/1 or /local_names/1.json
  def show
  end

  # GET /local_names/new
  def new
    @local_name = LocalName.new
  end

  # GET /local_names/1/edit
  def edit
  end

  # POST /local_names or /local_names.json
  def create
    @local_name = LocalName.new(local_name_params)

    respond_to do |format|
      if @local_name.save
        format.html { redirect_to local_name_url(@local_name), notice: "Local name was successfully created." }
        format.json { render :show, status: :created, location: @local_name }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @local_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /local_names/1 or /local_names/1.json
  def update
    respond_to do |format|
      if @local_name.update(local_name_params)
        format.html { redirect_to local_name_url(@local_name), notice: "Local name was successfully updated." }
        format.json { render :show, status: :ok, location: @local_name }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @local_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /local_names/1 or /local_names/1.json
  def destroy
    @local_name.destroy

    respond_to do |format|
      format.html { redirect_to local_names_url, notice: "Local name was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local_name
      @local_name = LocalName.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def local_name_params
      params.require(:local_name).permit(:name, :language_id, :local_id)
    end
end
