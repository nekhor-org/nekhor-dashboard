class LocalsController < ApplicationController
  before_action :set_local, only: %i[ show edit update destroy ]

  # GET /locals or /locals.json
  def index
    @locals = Local.all
  end

  # GET /locals/1 or /locals/1.json
  def show
  end

  # GET /locals/new
  def new
    @local = Local.new
  end

  # GET /locals/1/edit
  def edit
  end

  # POST /locals or /locals.json
  def create
    @local = Local.new(local_params)
    respond_to do |format|
      if @local.save
        format.html { redirect_to locals_path, notice: "Local was successfully created." }
        format.json { render :show, status: :created, location: @local }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @local.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locals/1 or /locals/1.json
  def update
    respond_to do |format|
      if @local.update(local_params)
        format.html { redirect_to locals_path, notice: "Local was successfully updated." }
        format.json { render :show, status: :ok, location: @local }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @local.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locals/1 or /locals/1.json
  def destroy
    @local.destroy

    respond_to do |format|
      format.html { redirect_to locals_url, notice: "Local was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local
      @local = Local.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def local_params
      params.require(:local).permit!
    end
end
