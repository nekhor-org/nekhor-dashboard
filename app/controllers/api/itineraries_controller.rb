class Api::ItinerariesController < ApiController
  before_action :set_itinerary, only: [:show]
  
  def index
    @itineraries = Itinerary.where(user_id: current_user.id)

    posts = @itineraries.map do |itinerary|
      {
        post: PostContentSerializer.new(itinerary.post.post_contents.where(language_id: @language.id).last),
        id: itinerary.id,
      }
    end

    render json: posts
  end

  def show
    render json: {
      post: PostContentSerializer.new(@itinerary.post.post_contents.where(language_id: @language.id).last),
      id: @itinerary.id,
    }
  end


  def create
    @itinerary = Itinerary.new(itinerary_params)
    @itinerary.user_id = current_user.id
    if @itinerary.save
      render json: {message: "Save success", error: false}, status: :ok
    else
      render json: { error: show_errors_field_json(@itinerary) }, status: 422
    end
  end
  
  def destroy
    if @itinerary.destroy
      render json: {message: "Deleted success", error: false}, status: :ok
    else
      render json: { error: show_errors_field_json(@itinerary) }, status: 422
    end
  end

  private

  def set_itinerary
    @itinerary = Itinerary.find(params[:id])
  end

  def itinerary_params
    params.require(:itinerary).permit!
  end
end
