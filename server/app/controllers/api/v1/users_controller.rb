class Api::V1::UsersController < Api::V1::BaseController
	def index
		@posts = Post.all

		@posts.each do |post|

			post.file_name = post.image_file_name

			path = File.join 'http://uofmeme.solutions/', @post.image.url
			post.uploaded_image_for_io_adapters = Base64.encode64(
				open(path) { |io| io.read })
		end

		render json: @posts, status: :ok
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
			status: 201
		)
	end

	private

	def user_params
		params.permit(:username, :email, :password, :password_confirmation)
	end

end