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
	  	@post = Post.new(post_params)

	  	toptxt = params[:post][:top_text]
 		bottxt = params[:post][:bot_text]

 	if post_params[:image].present?

 		unless toptxt.blank? && bottxt.blank? 
		  	uploaded_image = Magick::Image.read(post_params[:image].path)[0]
		  	temp = Tempfile.new("tmp")
		  	width = uploaded_image.columns
		  	height = uploaded_image.rows/3

		  	unless toptxt.blank?
			  	top_img = Magick::Image.read("caption:#{toptxt}") {
				 	self.fill = '#A9A9A9'
				 	self.stroke = '#000000'
				 	self.stroke_width = 0.1
				 	self.pointsize = width/10
				 	self.size = "#{width}x#{height}"
				 	self.background_color = "none"				  
				}.first
				uploaded_image = uploaded_image.composite(top_img, Magick::NorthGravity, Magick::OverCompositeOp)
			end

			unless bottxt.blank?
				bot_img = Magick::Image.read("caption:#{bottxt}") {
					self.fill = '#A9A9A9'
				 	self.stroke = '#000000'
					self.stroke_width = 0.01
					self.pointsize = width/10
					self.size = "#{width}x#{height}"
					self.background_color = "none"
				}.first
				uploaded_image = uploaded_image.composite(bot_img, Magick::SouthGravity, Magick::OverCompositeOp)
		  	end

			uploaded_image.format = "png"
			uploaded_image.write("_editedimage_.png")
			temp = File.open("_editedimage_.png", "r")	
 			@post = Post.new({:poster => post_params[:poster], :image => temp, :description => post_params[:description], :user_id => post_params[:user_id]})
 		end
 	end

	  	if @post.save
	  		flash[:info] = "Meme successfully created"
	     	redirect_to root_url
	  	else
	  		flash[:info] = "There was an error. Your Meme wasn't created"
	  		render "new"
	  	end

	  if post_params[:image].present?
	  	if !toptxt.blank? || !bottxt.blank?
	  		File.delete("_editedimage_.png")
	  		temp.close
	  	end
	  end
	end

	private

	def post_params
   		params.require(:post).permit(:poster, :image, :description, :user_id, :top_text, :bot_text)
	end
end