class Api::V1::DislikesController < Api::V1::BaseController

	def create
		@post = Post.find_by(id: params[:dislike_id])
	end


	def like_params
		params.require(:dislike).permit(:user_id, :post_id)
	end

end