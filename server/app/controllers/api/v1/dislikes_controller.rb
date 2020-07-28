class Api::V1::DislikesController < Api::V1::BaseController

	def create
		@post = Post.find_by(id: params[:post_id])

		if @post.present? && already_disliked
			#undo dislike
			remove_dislike

			render(
				json: {post: Api::V1::PostSerializer.new(@post)}.to_json,
				status: 200
			)
		else
			if @post.present?

				if already_liked
					remove_like
				end

				@dislike = Dislike.new(user_id: params[:user_id], post_id: @post.id)

				if @dislike.save
					dislike

					render(
						json: {post: Api::V1::PostSerializer.new(@post)}.to_json,
						status: 200
					)
				else
					render json: {errors: @dislike.errors}.to_json, status: :unprocessable_entity
				end
			else
				render json: {errors: "That post doesn't exist"}.to_json, status: :unprocessable_entity
			end
		end
	end


	def like_params
		params.require(:dislike).permit(:user_id, :post_id)
	end

	def already_disliked
		@dislike = Dislike.where(user_id: params[:user_id], post_id: @post.id).first
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
		@like = Like.where(user_id: params[:user_id], post_id: @post.id).first
		!@like.nil?
	end

	def remove_like
		@like.destroy
		@post.decrement! :like
		@post.save
	end

end