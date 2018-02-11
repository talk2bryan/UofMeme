class PostController < ApplicationController
  def home
    @home_title = "UofMeme"
    @home_header = "Welcome to UofMeme"
    @home_message = "Welcome to the UofMeme Home Page. We're under construction."
  end
end
