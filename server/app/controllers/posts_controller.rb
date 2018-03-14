class PostsController < ApplicationController

	def new
   		@post = Post.new
	end

	def index
		@posts = Post.all
	end
   
   	def show
   		@post = Post.find(params[:post_id])
   	end

	def create
	  	@post = Post.new(post_params)

	  	if @post.save
	  		flash[:info] = "Meme successfully created"
	     	redirect_to root_url
	  	else
	  		flash[:info] = "There was an error. Your Meme wasn't created"
	  		render "new"
	  	end
	end

	private

	def post_params
   		params.require(:post).permit(:poster, :image, :description, :user_id)
	end
end
