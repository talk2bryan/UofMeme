class PostsController < ApplicationController
	def new
   		@post = Post.new
	end

	def index
		@posts = Post.all
	end
   
   	def show
   		@post = Post.find(params[:id])
   	end

	def create
	  	@post = Post.new(post_params)

	  	if @post.save
	     	redirect_to :action => 'index'
	  	else
	  		render "new"
	  	end
	end

	private

	def post_params
   		params.require(:post).permit(:poster, :image, :description)
	end
end
