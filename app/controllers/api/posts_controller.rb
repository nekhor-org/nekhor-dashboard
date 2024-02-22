class Api::PostsController < ApiController
  skip_before_action :authenticate_request
  def index
    @q = Post.ransack(params[:q])
    
    posts = @q.result.map do |post|
      post.post_contents.where(language_id: @language.id).last
    end

    render json: posts
  end

  def get_itineraries
    @locals = Local.where.not(id: 1)

    locals =  @locals.map do |local|
      local.local_names.where(language_id: @language.id).last
    end

    @itineraries = locals.map do |local|
      @q = Post.where(local_id: local.local_id)
      
      posts = @q.map do |post|
        post.post_contents.where(language_id: @language.id).last
      end

      {
        local: local,
        posts: ActiveModelSerializers::SerializableResource.new(posts, each_serializer: PostContentSerializer)
      }
    end


    render json: @itineraries
  end

  def show
    @post = Post.find(params[:id])

    render json: @post.post_contents.where(language_id: @language.id).last
  end
end
