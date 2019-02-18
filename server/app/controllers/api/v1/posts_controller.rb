require 'base64'
require 'stringio'

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

		supported_data_type = ["image/png", "image/jpg", "image/jpeg", "image/gif"]
		image_data_type = data_type.to_s

		if params[:post][:uploaded_image_for_io_adapters] && params[:post][:file_name] && (supported_data_type.include?(image_data_type))
			content_type = Mime::Type.lookup_by_extension(File.extname(image_name)[1..-1]).to_s

			@post.image.attach(
				io: image_io,
				filename: image_name,
				content_type: image_data_type
			)

		end

		if @post.save
			url = url_for(@post.image)
			@post.uploaded_image_for_io_adapters = url
			
			render(
				json: {post: Api::V1::PostSerializer.new(@post)}.to_json,
				status: 201
			)
	    else
	        render json: {errors: @post.errors}.to_json, status: :unprocessable_entity
	    end
	end

	private

	def post_params
		params.require(:post).permit(:poster, :description, :user_id, :file_name, :uploaded_image_for_io_adapters)
	end

	def decoded_image
		encoded_image = params[:post][:uploaded_image_for_io_adapters]
		decoded_image = encoded_image ? Base64.decode64(encoded_image) : ""
	end

	def image_io
		StringIO.new(decoded_image)
	end

	def image_name
		params[:post][:file_name]
	end

	def data_type
		require 'mimemagic'
		MimeMagic.by_magic(decoded_image)
	end
end
