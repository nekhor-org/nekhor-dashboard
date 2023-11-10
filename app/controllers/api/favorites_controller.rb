class Api::FavoritesController < ApiController
  before_action :set_favorite, only: [:show]

  def index
    @favorites = Favorite.where(user_id: current_user.id)

    posts = @favorites.map do |favorite|
      {
        post: PostContentSerializer.new(favorite.post.post_contents.where(language_id: @language.id).last),
        id: favorite.id,
      }
    end

    render json: posts
  end

  def show
    render json: {
      post: PostContentSerializer.new(@favorite.post.post_contents.where(language_id: @language.id).last),
      id: @favorite.id,
    }
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.user_id = current_user.id
    if @favorite.save
      render json: {message: "Save success", error: false}, status: :ok
    else
      render json: { error: show_errors_field_json(@favorite) }, status: 422
    end
  end
  
  def destroy
    if @favorite.destroy
      render json: {message: "Deleted success", error: false}, status: :ok
    else
      render json: { error: show_errors_field_json(@favorite) }, status: 422
    end
  end

  private

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  def favorite_params
    params.require(:favorite).permit!
  end
end
