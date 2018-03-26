class Api::V1::LikesController < Api::V1::BaseController

	def create
		@post = Post.find_by(id: params[:like_id])
	end


	def like_params
		params.require(:like).permit(:user_id, :post_id)
	end

end