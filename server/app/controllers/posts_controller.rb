class PostsController < ApplicationController

	#respond_to :js , only: :like

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

	def like
		@post = Post.find(params[:post_id])
		@post.increment! :like	
		@post.save	
		@posts= Post.all 

		respond_to do |format|
			format.js {render "/posts/like.js.erb" }
		end	

	end

	def dislike
		@post = Post.find(params[:post_id])
		@post.increment! :dislike
		@post.save
		@posts= Post.all 

		respond_to do |format|
			format.js {render "/posts/dislike.js.erb" }
		end	
	end

	private

	def post_params
   		params.require(:post).permit(:poster, :image, :description)
	end
end
