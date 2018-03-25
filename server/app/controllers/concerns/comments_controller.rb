class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_post_comment, only: [:show, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    #@comments = Comment.all
    json_response(@post.comments)
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    json_response(@comment)
  end

  # POST /comments
  # POST /comments.json
  def create
    #@comment = Comment.new(comment_params)
    @post.comments.create!(comment_params)


    # if @comment.save
    #   render :show, status: :created, location: @comment
    # else
    #   render json: @comment.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @comment.update(comment_params)

    # if @comment.update(comment_params)
    #   render :show, status: :ok, location: @comment
    # else
    #   render json: @comment.errors, status: :unprocessable_entity
    # end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.permit(:commenter)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_post_comment
      @comment = @post.comments.find_by!(id: params[:id]) if @post
    end
end