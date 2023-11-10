class Api::PostsController < ApiController
  skip_before_action :authenticate_request
  def index
    @q = Post.ransack(params[:q])
    
    posts = @q.result.map do |post|
      post.post_contents.where(language_id: @language.id).last
    end

    render json: posts
  end

  def show
    @post = Post.find(params[:id])

    render json: @post.post_contents.where(language_id: @language.id).last
  end
end
