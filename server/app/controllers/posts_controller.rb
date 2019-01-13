class PostsController < ApplicationController

	def new
   		@post = Post.new
	end

	def index
		@posts = Post.all.includes(image_attachment: :blob)
	end
   
   	def show
   		@post = Post.find(params[:post_id])
   	end

	def create
	  @post = Post.new(post_params)
        
 		if post_params[:image].present?
      unless @post.image.content_type.starts_with?('image/gif')
        unless params[:post][:top_text].blank? && params[:post][:top_text].blank?
          top_txt = params[:post][:top_text]
          bot_txt = params[:post][:bot_text]

          if Rails.env.production?
            temp_img = MiniMagick::Image.open(url_for(@post.image))
          else
            temp_img =
            MiniMagick::Image.open(ActiveStorage::Blob.service.send(:path_for,
            @post.image.key))
          end

          temp_img.combine_options do |c|
            c.gravity 'North'
            c.pointsize '35'
            c.draw "text 0, 0 '#{top_txt}'"
            c.fill('#000000')
            c.gravity 'South'
            c.draw "text 0, 0 '#{bot_txt}'"
            c.fill('#000000')
            c.font 'Helvetica'
          end
          ext = File.extname(@post.image.filename.to_s)
          temp_img_filename = "_editedimage_#{ext}"
          temp_img.write(temp_img_filename)

          @post.image.attach(io: File.open(temp_img_filename), filename:
          @post.image.filename, content_type: @post.image.content_type)
          File.delete(temp_img_filename)
        end
      end
    end

	  if @post.save
	    flash[:info] = "Meme successfully created"
	    redirect_to root_url
	  else
	    flash[:info] = "There was an error. Your Meme wasn't created"
	  	render "new"
	  end
	end

	private

	def post_params
   		params.require(:post).permit(:poster, :image, :description, :user_id, :top_text, :bot_text)
	end
end
