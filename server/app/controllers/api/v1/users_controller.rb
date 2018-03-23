class Api::V1::UsersController < Api::V1::BaseController

	before_action :authenticate_user!, only: [:update, :destroy]

	def index
		@posts = Post.all
		render json: @posts
	end

	def show
		@user = User.find(params[:id])
		render json: @user
	end

	def create
		@user = User.new(user_params)
		return api_error(status: 422, errors: @user.errors) unless @user.valid?

		@user.save

		render(
			json: Api::V1::UserSerializer.new(@user).to_json,
			status: 201,
			location: api_v1_user_path(@user.id)
		)
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation).delete_if{ |k,v| v.nil?}
	end

end