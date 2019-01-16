class Api::V1::PostsController < Api::V1::BaseController
	require 'open-uri'

	def show
		require "base64"

		@post = Post.find(params[:id])

		@post.file_name = @post.image.blob.filename

		@post.uploaded_image_for_io_adapters = Base64.encode64(@post.image.download)
		
		render json: @post, status: :ok
	end

	def create
		@post = Post.new(post_params)

		if params[:post][:uploaded_image_for_io_adapters]
			content_type = Mime::Type.lookup_by_extension(File.extname(params[:post][:file_name])[1..-1]).to_s
			image_file = Paperclip.io_adapters.for("data:#{content_type};base64,#{params[:post][:uploaded_image_for_io_adapters]}")
			image_file.original_filename = params[:post][:file_name]
			@post.image = image_file
		end

	 	if @post.save
	        render json: @post, status: :created
	    else
	        render json: @post.errors, status: :unprocessable_entity
	    end
	end

	private

	def post_params
		params.permit(:poster, :description, :user_id, :file_name, :uploaded_image_for_io_adapters)
	end

end