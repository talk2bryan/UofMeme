class PostsController < ApplicationController
  include WrapText

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
        unless params[:post][:top_text].blank? &&
          params[:post][:top_text].blank?
          top_txt = params[:post][:top_text].upcase
          bot_txt = params[:post][:bot_text].upcase

          if Rails.env.production?
            imageUrl = url_for(@post.image)
          else
            imageUrl = ActiveStorage::Blob.service.send(:path_for,
                                                        @post.image.key)
          end

          m_image = Magick::ImageList.new
          urlImage = open(imageUrl)
          m_image.from_blob(urlImage.read)
          width = m_image.columns

          north_text = wrap_text(top_txt, width)
          south_text = wrap_text(bot_txt, width)

          top = Magick::Draw.new
          top.pointsize = 80
          top.gravity = Magick::NorthGravity

          top.annotate(m_image, 0,0,0,0, north_text) {
            self.fill = 'white'
            self.stroke = 'black'
            self.stroke_width = 2
            self.font = "#{Rails.root.join('public', 'font',
                           'Franklin_Gothic_Heavy_Regular.ttf')}"
            self.font_weight = Magick::BoldWeight
          }

          bottom = Magick::Draw.new
          bottom.pointsize = 80
          bottom.gravity = Magick::SouthGravity

          bottom.annotate(m_image, 0,0,0,0, south_text) {
            self.fill = 'white'
            self.stroke = 'black'
            self.stroke_width = 2
            self.font = "#{Rails.root.join('public', 'font',
                           'Franklin_Gothic_Heavy_Regular.ttf')}"
            self.font_weight = Magick::BoldWeight
          }

          ext = File.extname(@post.image.filename.to_s)
          temp_img_filename = "_editedimage_#{ext}"
          m_image.write(temp_img_filename)
          
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
