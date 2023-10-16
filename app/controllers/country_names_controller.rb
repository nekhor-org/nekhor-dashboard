class CountryNamesController < ApplicationController
  before_action :set_country_name, only: %i[ show edit update destroy ]

  # GET /country_names or /country_names.json
  def index
    @country_names = CountryName.all
  end

  # GET /country_names/1 or /country_names/1.json
  def show
  end

  # GET /country_names/new
  def new
    @country_name = CountryName.new
  end

  # GET /country_names/1/edit
  def edit
  end

  # POST /country_names or /country_names.json
  def create
    @country_name = CountryName.new(country_name_params)

    respond_to do |format|
      if @country_name.save
        format.html { redirect_to country_name_url(@country_name), notice: "Country name was successfully created." }
        format.json { render :show, status: :created, location: @country_name }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @country_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /country_names/1 or /country_names/1.json
  def update
    respond_to do |format|
      if @country_name.update(country_name_params)
        format.html { redirect_to country_name_url(@country_name), notice: "Country name was successfully updated." }
        format.json { render :show, status: :ok, location: @country_name }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @country_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /country_names/1 or /country_names/1.json
  def destroy
    @country_name.destroy

    respond_to do |format|
      format.html { redirect_to country_names_url, notice: "Country name was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country_name
      @country_name = CountryName.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def country_name_params
      params.require(:country_name).permit(:name, :language_id, :country_id)
    end
end
