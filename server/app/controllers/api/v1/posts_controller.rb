require 'base64'
require 'stringio'

class Api::V1::PostsController < Api::V1::BaseController

	def show
		@post = Post.find(params[:id])

		@post.file_name = @post.image_file_name

		path = File.join 'http://uofmeme.solutions/', @post.image.url
		@post.uploaded_image_for_io_adapters = Base64.encode64(
			open(path) { |io| io.read })

		render json: @post, status: :ok
	end

	def create
		@post = Post.new(post_params)

		if params[:post][:uploaded_image_for_io_adapters]
      base64_image = [:post][:uploaded_image_for_io_adapters].sub(/^data:.*,/,
                                                                  '')
      decoded_image = Base64.decode64(base64_image)
      image_io = StringIO.new(decoded_image)
			image_content_type =
        Mime::Type.lookup_by_extension(File.extname(params[:post][:file_name])[1..-1]).to_s
      @post.image.attach(io: image_io, file_name: params[:post][:file_name],
                         content_type: image_content_type)			
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
