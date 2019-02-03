class Api::V1::PostsController < Api::V1::BaseController
	require "base64"

	def show
		@post = Post.find(params[:id])

		@post.file_name = @post.image.blob.filename

		url = url_for(@post.image)

		@post.uploaded_image_for_io_adapters = url
		
		render json: @post, status: :ok
	end

	def create
		@post = Post.new(post_params)

		if params[:post][:uploaded_image_for_io_adapters]
			content_type = Mime::Type.lookup_by_extension(File.extname(params[:post][:file_name])[1..-1]).to_s

			@post.image.attach(
				io: image_io,
				filename: image_name,
				content_type: content_type
			)
		end

		 if @post.save
			url = url_for(@post.image)
			@post.uploaded_image_for_io_adapters = url
			
			render(
				json: Api::V1::PostSerializer.new(@post).to_json,
				status: 201
			)
	    else
	        render json: @post.errors, status: :unprocessable_entity
	    end
	end

	private

	def post_params
		params.require(:post).permit(:poster, :description, :user_id, :file_name, :uploaded_image_for_io_adapters)
	end

	def image_io
		decoded_image= Base64.decode64(params[:post][:uploaded_image_for_io_adapters])
		StringIO.new(decoded_image)
	end

	def image_name
		params[:post][:file_name]
	end
end