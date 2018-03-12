class DislikesController < ApplicationController
	def new
	end

	def show
   		@post = Post.find(params[:dislike_id])
   	end

	def create
		@post = Post.find_by(id: params[:dislike_id])
		if already_disliked
			#undo like
			remove_dislike
			@posts= Post.all
			respond_to do |format|
				format.js {render "/likes/create.js.erb" } 
			end
		else
			if @post.present?
				#like the post

				if already_liked
					remove_like
				end

				@dislike = Dislike.new(username: current_user.username, postid: @post.id)

				if @dislike.save
					dislike
					@posts= Post.all
					respond_to do |format|
						format.js {render "/dislikes/create.js.erb"} 
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

	def dislike_params
		params.require(:dislike).permit(:username, :postid)
	end

	def already_disliked
		@dislike = Dislike.where(username: current_user.username, postid: @post.id).first
		!@dislike.nil?
	end

	def remove_dislike
		@dislike.destroy
		@post.decrement! :dislike
		@post.save
	end

	def dislike
		@post.increment! :dislike	
		@post.save	
	end

	def already_liked
		@like = Like.where(username: current_user.username, postid: @post.id).first
		!@like.nil?
	end

	def remove_like
		@like.destroy
		@post.decrement! :like
		@post.save
	end


end
