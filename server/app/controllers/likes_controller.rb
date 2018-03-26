class LikesController < ApplicationController
	def new
	end

	def show
   		@post = Post.find(params[:like_id])
   	end

	def create
		@post = Post.find_by(id: params[:like_id])
		@current_page = session[:my_previous_url]


		if already_liked
			#undo like
			remove_like
			get_posts
			respond_to do |format|
				format.js {render "/likes/create.js.erb" } 
			end
		else
			if @post.present?
				#like the post

				if already_disliked
					remove_dislike
				end

				@like = Like.new(user_id: current_user.id, post_id: @post.id)

				if @like.save
					like
					get_posts
					respond_to do |format|
						format.js {render "/likes/create.js.erb" } 
					end
				else
					flash[:info] = "An error occurred"
					redirect_to root_url
				end
			else
				#redirect to root url
				flash[:info] = "An error occurred"
				redirect_to root_url
			end
		end
	end

	private

	def like_params
		params.require(:like).permit(:user_id, :post_id)
	end

	def already_liked
		@like = Like.where(user_id: current_user.id, post_id: @post.id).first
		!@like.nil?
	end

	def remove_like
		@like.destroy
		@post.decrement! :like
		@post.save
	end

	def like
		@post.increment! :like	
		@post.save	
	end

	def already_disliked
		@dislike = Dislike.where(user_id: current_user.id, post_id: @post.id).first
		!@dislike.nil?
	end

	def remove_dislike
		@dislike.destroy
		@post.decrement! :dislike
		@post.save
	end

	def get_posts
		if @current_page && @current_page.include?("users/#{current_user.id}") 
			@posts = Post.where(user_id: current_user.id).all

		else
			@posts= Post.all
		end
	end

end
