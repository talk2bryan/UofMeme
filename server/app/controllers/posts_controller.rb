class PostsController < ApplicationController

	def new
   		@post = Post.new
	end

	def index
		@posts = Post.all
	end
   
   	def show
   		@post = Post.find(params[:post_id])
   	end

	def create
		require 'rubygems'
		require 'RMagick'

	  	#@post = Post.new(post_params)
	  	image = Magick::ImageList.new
	  	txt = Magick::Draw.new

	  	path = "/home/vagrant/UofMeme_image/UofMeme/server/app/assets/images/uofmeme_logo.png"

	  	img = image.read(path).first

	  	img.annotate(txt,0,0,0,0,"text text"){
			txt.gravity = Magick::SouthGravity
			txt.pointsize = 10
			txt.stroke = '#000000'
			txt.fill = '#ffffff'
			txt.font_weight = Magick::BoldWeight
		}

		img.format = 'png'
		img.write("editedimg.png")
		#paperclip_img = PaperclipModel.new(:paperclip_field => File.new("editedimg.jpeg","r"))
		#@post.image = img#paperclip_img
		#@post.image.url = "editedimg.png"
		@post = Post.new({:poster => "anton", :image => File.open("editedimg.png", "r"), :description => "this is my meme", :user_id => "fucker"})

	    #if params[:post][:uploaded_image_for_io_adapters]
	      #content_type = Mime::Type.lookup(img.to_s).to_s
	      #image_file = Paperclip.io_adapters.for("data:#{content_type};base64,#{params[:post][:uploaded_image_for_io_adapters]}")
	      #image_file.original_filename = params[:post][:file_name]
	      #
	      #@post.image = image_file
	    #end

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
   		params.require(:post).permit(:poster, :image, :description, :user_id)
	end
end
