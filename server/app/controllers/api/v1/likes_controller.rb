class Api::V1::LikesController < Api::V1::BaseController

	def create
		@post = Post.find_by(id: params[:post_id])

		if @post.present? && already_liked
			#undo like
			remove_like

			render(
				json: {post: Api::V1::PostSerializer.new(@post)}.to_json,
				status: 200
			)
		else
			if @post.present?

				if already_disliked
					remove_dislike
				end

				@like = Like.new(user_id: params[:user_id], post_id: @post.id)

				if @like.save
					like

					render(
						json: {post: Api::V1::PostSerializer.new(@post)}.to_json,
						status: 200
					)
				else
					render json: {errors: @like.errors}.to_json, status: :unprocessable_entity
				end
			else
				render json: {errors: "That post doesn't exist"}.to_json, status: :unprocessable_entity
			end
		end
	end

	private

	def like_params
		params.require(:like).permit(:user_id, :post_id)
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

	def like
		@post.increment! :like	
		@post.save	
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
end