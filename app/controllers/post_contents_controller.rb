class PostContentsController < ApplicationController
  before_action :set_post_content, only: %i[ show edit update destroy ]
  before_action :set_post

  # GET /post_contents or /post_contents.json
  def index
    @post_contents = PostContent.where(post_id: @post.id)
  end

  # GET /post_contents/1 or /post_contents/1.json
  def show
  end

  # GET /post_contents/new
  def new
    @post_content = PostContent.new
  end

  # GET /post_contents/1/edit
  def edit

    if params[:language_id].present?
      @post_content = @post.post_contents.where(language_id: params[:language_id]).last
    end
  end

  # POST /post_contents or /post_contents.json
  def create
    @post_content = PostContent.new(post_content_params)

    respond_to do |format|
      if @post_content.save
        format.html { redirect_to post_content_url(@post_content), notice: "Post content was successfully created." }
        format.json { render :show, status: :created, location: @post_content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_contents/1 or /post_contents/1.json
  def update
    respond_to do |format|
      if @post_content.update(post_content_params)
        format.html { redirect_to post_post_contents_url(@post), notice: "Post content was successfully updated." }
        format.json { render :show, status: :ok, location: @post_content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_contents/1 or /post_contents/1.json
  def destroy
    @post_content.destroy

    respond_to do |format|
      format.html { redirect_to post_contents_url, notice: "Post content was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_content
      @post_content = PostContent.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    # Only allow a list of trusted parameters through.
    def post_content_params
      params.require(:post_content).permit(:title, :subtitle, :content, :post_id, :language_id)
    end
end
