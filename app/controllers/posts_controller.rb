class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy toggle]

  # GET /posts or /posts.json
  def index
    @posts = Post.all.order(created_at: :asc)
  end
  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.images.build
    @post.audios.build
  end

  # GET /posts/1/edit
  def edit
    @post.images.build unless @post.images.present?
    @post.audios.build unless @post.audios.present?
  end

  def toggle
    @post.update has_home: !@post.has_home

    redirect_to posts_path
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.local_id = @post.country&.local&.id
    respond_to do |format|
      if @post.save!
        format.html { redirect_to posts_path, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        @post.images.build unless @post.images.present?
        @post.audios.build unless @post.audios.present?
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_path, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        @post.images.build unless @post.images.present?
        @post.audios.build unless @post.audios.present?
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit!
    end
end
