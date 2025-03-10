class LabelsController < ApplicationController
  before_action :set_label, only: %i[ show edit update destroy ]

  # GET /labels or /labels.json
  def index
    @labels = Label.all
  end

  # GET /labels/1 or /labels/1.json
  def show
  end

  # GET /labels/new
  def new
    @label = Label.new
  end

  # GET /labels/1/edit
  def edit
  end

  # POST /labels or /labels.json
  def create
    @label = Label.new(label_params)

    respond_to do |format|
      if @label.save
        format.html { redirect_to label_url(@label), notice: "Label was successfully created." }
        format.json { render :show, status: :created, location: @label }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @label.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labels/1 or /labels/1.json
  def update
    respond_to do |format|
      if @label.update(label_params)
        format.html { redirect_to label_url(@label), notice: "Label was successfully updated." }
        format.json { render :show, status: :ok, location: @label }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @label.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labels/1 or /labels/1.json
  def destroy
    @label.destroy

    respond_to do |format|
      format.html { redirect_to labels_url, notice: "Label was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_label
      @label = Label.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def label_params
      params.require(:label).permit(:my_favorites, :already_visited, :my_itinerary, :remove_all, :add, :save, :view_in_map, :share, :reorder, :edit, :delete, :choose_itinerary_name, :language_id)
    end
end
