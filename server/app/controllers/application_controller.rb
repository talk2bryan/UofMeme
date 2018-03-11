class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper
    
    def hello
        render html: "Welcome to the UofMeme Home Page. We're under construction."
    end
end
