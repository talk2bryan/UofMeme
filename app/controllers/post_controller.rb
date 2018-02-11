class PostController < ApplicationController
  def home
    @home_title = "U of Meme"
    @home_header = "Welcome to U of Meme"
    @home_message = "Welcome to the UofMeme Home Page. We're under construction."
  end
end
